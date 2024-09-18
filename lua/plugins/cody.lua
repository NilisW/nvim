-- Use your favorite package manager to install, for example in lazy.nvim
--  Optionally, you can also install nvim-telescope/telescope.nvim to use some search functionality.
return {
  {
    "sourcegraph/sg.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("sg").setup({
        -- Pass your own custom attach function
        --    If you do not pass your own attach function, then the following maps are provided:
        --        - gd -> goto definition
        --        - gr -> goto references
        on_attach = function(client, bufnr)
          -- Your custom LSP attach function here
          -- For example:
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr })
          vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = bufnr })
          vim.keymap.set("n", "<space>ss", function()
            require("sg.extensions.telescope").fuzzy_search_results()
          end, { desc = "Sourcegraph fuzzy search" })
        end,
      })
    end,
  },
}
