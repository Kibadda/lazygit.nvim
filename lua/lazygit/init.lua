local context = require("lazygit.context")

local M = {
  opts = {
    layout = {
      relative = "editor",
      width = vim.fn.float2nr(vim.fn.round(0.7 * vim.o.columns)),
      height = vim.fn.float2nr(vim.fn.round(0.7 * vim.o.lines)),
      col = vim.fn.float2nr(vim.fn.round(0.15 * vim.o.columns)),
      row = vim.fn.float2nr(vim.fn.round(0.15 * vim.o.lines)),
      style = "minimal",
      border = "single"
    }
  }
}

local function create_lazygit()
  context.bufnr(vim.api.nvim_create_buf(false, true))
  local winid = vim.api.nvim_open_win(context.bufnr(), true, M.opts.layout)
  context.winid(winid)
  vim.fn.termopen("lazygit")
  vim.cmd.startinsert()
end

function M.setup(opts)
  opts = opts or {}
  M.opts = vim.tbl_deep_extend("keep", opts, M.opts)
end

function M.toggle()
  local winid = context.winid()
  if context.bufnr() ~= -1 then
    if winid ~= -1 and vim.api.nvim_win_is_valid(winid) then
      vim.api.nvim_win_close(winid)
    else
      vim.api.nvim_set_current_win(winid)
      vim.cmd.startinsert()
    end
  else
    M.init()
  end
end

function M.init()
  if context.bufnr() ~= -1 then
    return
  end

  create_lazygit()
end

return M
