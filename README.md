# status-std
The standard collection of component sources for [status.nvim](https://github.com/shizukani-cp/status.nvim).

| Source | Description | Example Output |
|:---|:---|:---|
| `mode()` | Current mode with highlights | `%#StatusNORMAL# NORMAL %#StatusMain#` |
| `file()` | Filename + modified flag | `main.lua [+]` |
| `filetype()` | Buffer filetype | `lua` |
| `encoding()` | File encoding | `utf-8` |
| `filesize()` | Human-readable size | `1.2KB` |
## Usage
```lua
local status = require("status.core")
local std = require("status.std")

status.setup({
    components = {
        left = {
            std.mode,
            " ",
            std.file,
        },
        right = {
            std.filesize,
            " | ",
            std.filetype,
        }
    }
})
```

## Highlights
`std.mode()` requires highlight groups to be defined in your configuration:
- `StatusNORMAL`, `StatusINSERT`, `StatusVISUAL`, etc.
- `StatusMain` (used as the default separator highlight)
