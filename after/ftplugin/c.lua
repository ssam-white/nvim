vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.handlers["textDocument/publishDiagnostics"],
  {
    -- Customize the handler to filter specific diagnostics
    filter = function(diagnostic)
      -- Suppress only the specific warning about FreeRTOS.h
      if diagnostic.message and diagnostic.message:find("Included header FreeRTOS.h is not used directly") then
        return false
      end
      return true
    end,
  }
)
