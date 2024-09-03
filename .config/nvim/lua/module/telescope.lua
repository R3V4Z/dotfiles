local telescope = require "telescope"
local builtin = require "telescope.builtin"
local actions = require "telescope.actions"

telescope.load_extension "fzf"
telescope.setup{
  defaults = {
    file_ignore_patterns = {
      ".git",
      "node_modules"
    },
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      }
    }
  },
  pickers = {
    find_files = {
      hidden = true
    },
    live_grep = {
      additional_args = { "--hidden" }
    },
    grep_string = {
      additional_args = { "--hidden" }
    },
    buffers = {
      previewer = false,
      mappings = {
        i = {
          ["<C-d>"] = actions.delete_buffer
        }
      }
    },
  }
}

vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
