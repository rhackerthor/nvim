vim.pack.add(
  {
    { src = "https://github.com/scalameta/nvim-metals" },
  }, {
    -- 自定义加载逻辑：当匹配文件类型时才真正加载插件
    load = function(plug_data)
      local augroup = vim.api.nvim_create_augroup("nvim-metals-lazy", { clear = true })
  
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "scala", "sbt", "java" },
        group = augroup,
        callback = function()
          -- 只在首次需要时执行 packadd（避免重复加载）
          if not package.loaded["metals"] then
            vim.cmd.packadd(plug_data.spec.name)
          end
  
          -- 构建 metals 配置（等效于原 opts 函数）
          local metals_config = require("metals").bare_config()
          metals_config.on_attach = function(client, bufnr)
            -- 在这里定义你的 on_attach 逻辑（与原配置一致）
            -- 例如：绑定快捷键、设置诊断等
          end
  
          -- 初始化或附着到当前项目
          require("metals").initialize_or_attach(metals_config)
        end,
      })
    end,
  }
)
