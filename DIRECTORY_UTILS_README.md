# Directory Utilities for Neovim

This setup adds functionality to temporarily limit searches to subdirectories and switch working directories in your Neovim configuration.

## Features

### Search Directory Limiting
- **Set search directory limit**: `<leader>fd` - Limit telescope and cscope searches to a specific subdirectory
- **Clear search directory limit**: `<leader>fD` - Clear the search directory limit
- **Show search status**: `<leader>fs` - Show current search directory status
- **Limited live grep**: `<leader>fl` - Live grep within the limited directory
- **Limited find files**: `<leader>ffl` - Find files within the limited directory

### Directory Switching
- **Change to subdirectory**: `<leader>ed` - Change working directory to a subdirectory
- **Change to file directory**: `<leader>ep` - Change to current file's directory
- **Change to git root**: `<leader>er` - Change to git root directory

### CScope Integration
CScope searches will automatically respect the directory limit set with `<leader>fd`. When a search directory is set, cscope will use the `cscope.out` file from that directory.

## Usage

1. **To limit searches to a subdirectory**:
   - Press `<leader>fd` and enter the subdirectory path
   - All subsequent telescope and cscope searches will be limited to that directory
   - Use `<leader>fl` for live grep or `<leader>ffl` for find files within the limited directory

2. **To switch working directories**:
   - Press `<leader>ed` to change to any subdirectory
   - Press `<leader>ep` to change to current file's directory
   - Press `<leader>er` to change to git root directory

3. **To clear search limits**:
   - Press `<leader>fD` to clear the search directory limit
   - Press `<leader>fs` to show current search status

The search directory limit is temporary and only affects telescope and cscope operations. It does not change your actual working directory.