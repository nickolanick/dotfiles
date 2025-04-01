local neotest_ns = vim.api.nvim_create_namespace("neotest")
    vim.diagnostic.config({
      virtual_text = {
        format = function(diagnostic)
          local message =
            diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
          return message
        end,
      },
    }, neotest_ns)

require("neotest").setup({
  adapters = {
    require("neotest-go")({
      dap = { justMyCode = false },
    }),
--    require("neotest-plenary"),
--    require("neotest-vim-test")({
--     ignore_file_types = { "python", "vim", "lua" },
--   }),
  },
})


vim.api.nvim_set_keymap('n', '<leader>t', '<cmd>lua require("neotest").run.run(vim.fn.expand("%"))<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>T', '<cmd>lua require("neotest").summary.toggle()<CR>', {})

