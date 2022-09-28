local buffer = -1
local window = -1

local M = {}

function M.bufnr(bufnr)
  local old = buffer
  if bufnr ~= nil then
    buffer = bufnr
  end
  return old
end

function M.winid(winid)
  local old = window
  if winid ~= nil then
    window = winid
  end
  return old
end

return M
