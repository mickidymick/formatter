#include <yed/plugin.h>

void formatter_fmt(yed_event* event);
void run_formatter(int nargs, char** args);
int  auto_formatter(char *path);

int yed_plugin_boot(yed_plugin *self) {
    yed_event_handler auto_formatter_eh;

    YED_PLUG_VERSION_CHECK();

    auto_formatter_eh.kind = EVENT_BUFFER_POST_WRITE;
    auto_formatter_eh.fn   = formatter_fmt;

    if (yed_get_var("formatter-auto") == NULL) {
        yed_set_var("formatter-auto", "yes");
    }

    if (yed_get_var("formatter-no-backup") == NULL) {
        yed_set_var("formatter-no-backup", "no");
    }

    yed_plugin_add_event_handler(self, auto_formatter_eh);

    yed_plugin_set_command(self, "run-formatter", run_formatter);
    return 0;
}

void formatter_fmt(yed_event* event) {
    if (!yed_var_is_truthy("formatter-auto")) {
        return;
    }

    if(!event->buffer
            || event->buffer->kind != BUFF_KIND_FILE) {
        return;
    }

    if (event->buffer->ft == yed_get_ft("C")
            ||  event->buffer->ft == yed_get_ft("C++")) {
        if(auto_formatter(event->buffer->path) == 0) {
            YEXE("buffer-reload");
        }
    }
}

void run_formatter(int nargs, char** args) {
    yed_frame *frame;
    frame = ys->active_frame;

    if(!frame
            || !frame->buffer
            || frame->buffer->kind != BUFF_KIND_FILE) {
        return;
    }

    if (frame->buffer->ft == yed_get_ft("C")
            ||  frame->buffer->ft == yed_get_ft("C++")) {
        if(auto_formatter(frame->buffer->path) == 0) {
            YEXE("buffer-reload");
            YEXE("redraw");
        }
    } else {
        yed_cerr("File type not C or C++");
    }
}

int auto_formatter(char *path) {
    int    status;
    char *command = (char *)malloc(1024 * sizeof(char));
    if (yed_var_is_truthy("formatter-no-backup")) {
        strcpy(command, "astyle -n ");

    } else {
        strcpy(command, "astyle ");
    }
    strcat(command, path);
    status = system(command);
    if (status != 0) {
        yed_log("Astyle must be installed");
    }

    return status;
}
