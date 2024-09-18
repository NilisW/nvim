return {
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")

      -- Add Cody as a source
      table.insert(opts.sources, 1, { name = "cody" }) -- Add Cody at the beginning of the sources list

      -- Optional: Add manual trigger for Cody completions
      opts.mapping = vim.tbl_extend("force", opts.mapping or {}, {
        ["<C-a>"] = cmp.mapping.complete({
          config = {
            sources = {
              { name = "cody" },
            },
          },
        }),
      })

      -- Optional: Add formatting for Cody items
      opts.formatting = opts.formatting or {}
      local format_func = opts.formatting.format
      opts.formatting.format = function(entry, vim_item)
        if format_func then
          vim_item = format_func(entry, vim_item)
        end

        -- Add menu item for Cody
        local menu_icon = {
          nvim_lsp = "[LSP]",
          cody = "[Cody]",
          -- Add other sources as needed
        }
        vim_item.menu = menu_icon[entry.source.name] or vim_item.menu

        return vim_item
      end

      return opts
    end,
  },
}
