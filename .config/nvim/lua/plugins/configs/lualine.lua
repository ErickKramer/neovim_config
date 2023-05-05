local function get_venv()
  local venv = vim.env.VIRTUAL_ENV
  if venv then
    local env = string.match(venv, "[^/]+$")
    return ' ' .. env
  else
    return ''
  end
end

local function maximize_status()
  return vim.t.maximized and '   ' or ''
end

local function get_ros_distro()
  local ros_distro = vim.fn.expand('$ROS_DISTRO')
  if ros_distro and ros_distro ~= '$ROS_DISTRO' then
    return '󰭆 ' .. ros_distro
  else
    return ''
  end
end

-- Set lualine as statusline
-- See `:help lualine.txt`
require('lualine').setup {
  options = {
    icons_enabled = true,
    -- theme = 'rose-pine',
    theme = 'catppuccin',
    component_separators = '|',
    section_separators = '',
    ignore_focus = {
      "dapui_watches", "dapui_breakpoints",
      "dapui_scopes", "dapui_console",
      "dapui_stacks", "dap-repl"
    },
    disabled_filetypes = { 'NvimTree', 'alpha' }
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff', 'diagnostics' },
    lualine_c = { 'filename', { maximize_status } },
    lualine_x = { { get_venv }, { get_ros_distro }, 'fileformat', 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = { 'location' }
  },
}
