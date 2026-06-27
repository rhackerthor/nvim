vim.pack.add(
  {
    { src = "https://github.com/scalameta/nvim-metals", name = "nvim-metals" },
  }, {
    load = function(plug_data)
      local metals_config
      local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "scala", "sbt", "java" },
        group = nvim_metals_group,
        callback = function()
          if not package.loaded["metals"] then
            vim.cmd.packadd(plug_data.spec.name)
          end

          metals_config = metals_config or require("metals").bare_config()

          require("metals").initialize_or_attach(metals_config)
        end,
      })
    end,
  }
)
