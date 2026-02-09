{
  inputs,
  ...
}:

let
  inherit (inputs.nvf.lib.nvim)
    dag
  ;
in

{
  programs.nvf.settings.vim = {
    # https://nvf.notashelf.dev/configuring.html#ch-using-dags
    luaConfigRC.basicLua = dag.entryBetween [ "optionsScript" ] [ "basic" ] ''
      -- disable intro message
      vim.opt.shortmess:append("I")

      -- do not stop at the start of insert
      vim.opt.backspace:append { "nostop" }

      -- highlight the current screen line
      vim.opt.cursorlineopt = { "number", "screenline" }

      -- traverse line breaks with arrow keys
      vim.opt.whichwrap:append {
        ["<"] = true,
        [">"] = true,
        ["["] = true,
        ["]"] = true,
      }

      vim.opt.mousescroll = { "ver:4" }

      do
        vim.filetype.add({
          extension = {
            env = "env",
            nu = "nu",
            hcl = function(_path, _bufnr)
              return "hcl", function(_bufnr)
                vim.opt.commentstring = "# %s"
              end
            end,
          },

          filename = {
          },

          pattern = {
            [".*.env.example"] = "env",
          },
        })
      end

      do
        -- Alt+[1-9] to change the buffer
        -- TODO: cache this
        local function GetListedBuffers()
          return vim.tbl_filter(
            function(buf) return vim.api.nvim_buf_get_option(buf, "buflisted") end,
            vim.api.nvim_list_bufs()
          )
        end

        local function EditListedBuffer(index)
          local buffers = GetListedBuffers()
          local buffer = buffers[index]

          if buffer then
            vim.api.nvim_set_current_buf(buffer)
          end
        end

        for i=1,9 do
          vim.keymap.set("n", string.format("<M-%d>", i), function() EditListedBuffer(i) end)
        end
      end

      do
        -- close the current buffer or quit
        local function forceDelete()
          local result = vim.api.nvim_get_mode()
          local isTerminalMode = result.mode == "nt"

          return isTerminalMode
        end

        local function CloseBufferOrQuit()
          local ok, result = pcall(vim.api.nvim_buf_delete, 0, { force = forceDelete() })

          if not ok then
            vim.api.nvim_err_writeln(result)
            return
          end

          if vim.fn.line("$") == 1 and vim.fn.getline(1) == "" then
            vim.cmd.quit()
          end
        end

        vim.keymap.set("n", "<Leader>q", CloseBufferOrQuit)
        vim.keymap.set("n", "<C-w>", CloseBufferOrQuit)
      end
    '';
  };
}
