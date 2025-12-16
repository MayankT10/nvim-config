require("competitest").setup({
    local_config_file_name = ".competitest.lua",

    floating_border = "rounded",
    floating_border_highlight = "FloatBorder",

    picker_ui = {
        width = 0.25,
        height = 0.35,
        mappings = {
            focus_next = { "j", "<down>", "<Tab>" },
            focus_prev = { "k", "<up>", "<S-Tab>" },
            close = { "<esc>", "<C-c>", "q", "Q" },
            submit = "<cr>",
        },
    },

    editor_ui = {
        popup_width = 0.45,
        popup_height = 0.65,
        show_nu = true,
        show_rnu = false,
        normal_mode_mappings = {
            switch_window = { "<C-h>", "<C-l>" },
            save_and_close = "<C-s>",
            cancel = { "q", "Q" },
        },
        insert_mode_mappings = {
            switch_window = { "<C-h>", "<C-l>" },
            save_and_close = "<C-s>",
            cancel = "<C-q>",
        },
    },

    runner_ui = {
        interface = "split",
        show_nu = true,
        show_rnu = false,

        mappings = {
            run_again = "R",
            run_all_again = "<C-r>",
            kill = "K",
            kill_all = "<C-k>",
            view_input = "i",
            view_output = "o",
            view_stdout = "s",
            view_stderr = "e",
            toggle_diff = "d",
            close = { "q", "Q" },
        },

        viewer = {
            width = 0.5,
            height = 0.5,
            show_nu = true,
            show_rnu = false,
            open_when_compilation_fails = true,
        },
    },

    split_ui = {
        position = "right",
        relative_to_editor = true,

        total_width = 0.5,
        total_height = 1.0,

        vertical_layout = {
            { 1, "tc" },

            {
                2,
                {
                    { 1, "so" },
                    { 1, "eo" },
                },
            },

            {
                2,
                {
                    { 2, "si" },
                    { 1, "se" },
                },
            },
        },
    },

    save_current_file = true,
    save_all_files = false,

    compile_directory = ".",
    compile_command = {
        c = {
            exec = "gcc",
            args = { "-std=gnu11", "-O2", "-Wall", "-Wextra", "$(FNAME)", "-o", "$(FNOEXT)" },
        },
        cpp = {
            exec = "g++",
            args = {
                "-std=gnu++17",
                "-O2",
                "-Wall",
                "-Wextra",
                "-Wshadow",
                "$(FNAME)",
                "-o",
                "$(FNOEXT)",
            },
        },
        rust = {
            exec = "rustc",
            args = { "$(FNAME)", "-O", "-o", "$(FNOEXT)" },
        },
        java = { exec = "javac", args = { "$(FNAME)" } },
    },

    running_directory = ".",
    run_command = {
        c = { exec = "./$(FNOEXT)" },
        cpp = { exec = "./$(FNOEXT)" },
        rust = { exec = "./$(FNOEXT)" },
        python = { exec = "python", args = { "$(FNAME)" } },
        java = { exec = "java", args = { "$(FNOEXT)" } },
    },

    multiple_testing = -1,
    maximum_time = 5000,
    output_compare_method = "squish",
    view_output_diff = false,

    testcases_directory = ".",
    testcases_use_single_file = false,
    testcases_auto_detect_storage = true,
    testcases_single_file_format = "$(FNOEXT).testcases",
    testcases_input_file_format = "$(FNOEXT)_input$(TCNUM).txt",
    testcases_output_file_format = "$(FNOEXT)_output$(TCNUM).txt",

    companion_port = 27121,
    receive_print_message = true,

    received_files_extension = "cpp",
    received_problems_path = "$(CWD)/$(PROBLEM).$(FEXT)",
    received_contests_directory = "$(CWD)",
    received_contests_problems_path = "$(PROBLEM).$(FEXT)",

    open_received_problems = true,
    open_received_contests = true,
})
