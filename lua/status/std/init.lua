local M = {}

M.mode_map = {
    n = "NORMAL",
    i = "INSERT",
    v = "VISUAL",
    V = "V-LINE",
    ["\22"] = "V-BLOCK",
    c = "COMMAND",
    R = "REPLACE",
    t = "TERMINAL",
}

function M.mode()
    local raw_mode = vim.api.nvim_get_mode().mode
    local first_char = string.sub(raw_mode, 1, 1)
    local mode = M.mode_map[first_char] or raw_mode
    local hl_group = "Status" .. mode:gsub("-", "")
    local hl = "%#" .. hl_group .. "#"
    return hl .. " " .. mode .. " %#StatusMain#"
end

function M.file()
    return vim.fn.expand("%:t") .. (vim.bo.modified and " [+]" or "")
end

function M.filetype()
    return vim.bo.filetype
end

function M.encoding()
    local fenc = vim.opt.fileencoding:get()
    return (fenc ~= "" and fenc) or vim.opt.encoding:get()
end

function M.filesize()
    local size = vim.fn.getfsize(vim.fn.expand("%"))
    if size <= 0 then
        return ""
    end

    local units = { "B", "KB", "MB", "GB" }
    local i = 1
    while size > 1024 and i < #units do
        size = size / 1024
        i = i + 1
    end

    return string.format("%.1f%s", size, units[i])
end

return M
