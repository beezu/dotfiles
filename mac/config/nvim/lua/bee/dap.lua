require("dapui").setup({
	icons = { expanded = "", collapsed = "", current_frame = "" },
	mappings = {
		-- Use a table to apply multiple mappings
		expand = { "<CR>", "<2-LeftMouse>" },
		open = "o",
		remove = "d",
		edit = "e",
		repl = "r",
		toggle = "t",
	},
	-- Use this to override mappings for specific elements
	element_mappings = {
		-- Example:
		-- stacks = {
		--   open = "<CR>",
		--   expand = "o",
		-- }
	},
	-- Expand lines larger than the window
	-- Requires >= 0.7
	expand_lines = vim.fn.has("nvim-0.7") == 1,
	-- Layouts define sections of the screen to place windows.
	-- The position can be "left", "right", "top" or "bottom".
	-- The size specifies the height/width depending on position. It can be an Int
	-- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
	-- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
	-- Elements are the elements shown in the layout (in order).
	-- Layouts are opened in order so that earlier layouts take priority in window sizing.
	layouts = {
		{
			elements = {
				-- Elements can be strings or table with id and size keys.
				{ id = "scopes", size = 0.25 },
				"breakpoints",
				"stacks",
				"watches",
			},
			size = 40, -- 40 columns
			position = "left",
		},
		{
			elements = {
				"repl",
				"console",
			},
			size = 0.25, -- 25% of total lines
			position = "bottom",
		},
	},
	controls = {
		-- Requires Neovim nightly (or 0.8 when released)
		enabled = true,
		-- Display controls in this element
		element = "repl",
		icons = {
			pause = "",
			play = "",
			step_into = "",
			step_over = "",
			step_out = "",
			step_back = "",
			run_last = "",
			terminate = "",
		},
	},
	floating = {
		max_height = nil, -- These can be integers or a float between 0 and 1.
		max_width = nil, -- Floats will be treated as percentage of your screen.
		border = "single", -- Border style. Can be "single", "double" or "rounded"
		mappings = {
			close = { "q", "<Esc>" },
		},
	},
	windows = { indent = 1 },
	render = {
		max_type_length = nil, -- Can be integer or nil.
		max_value_lines = 100, -- Can be integer or nil.
	},
})

-- LunarVim Defaults --
-- local M = {}
--
-- M.config = function()
--   vim.builtin.dap = {
--     active = true,
--     on_config_done = nil,
--     breakpoint = {
--       text = vim.icons.ui.Bug,
--       texthl = "DiagnosticSignError",
--       linehl = "",
--       numhl = "",
--     },
--     breakpoint_rejected = {
--       text = vim.icons.ui.Bug,
--       texthl = "DiagnosticSignError",
--       linehl = "",
--       numhl = "",
--     },
--     stopped = {
--       text = vim.icons.ui.BoldArrowRight,
--       texthl = "DiagnosticSignWarn",
--       linehl = "Visual",
--       numhl = "DiagnosticSignWarn",
--     },
--     log = {
--       level = "info",
--     },
--     ui = {
--       auto_open = true,
--       notify = {
--         threshold = vim.log.levels.INFO,
--       },
--       config = {
--         expand_lines = true,
--         icons = { expanded = "", collapsed = "", circular = "" },
--         mappings = {
--           -- Use a table to apply multiple mappings
--           expand = { "<CR>", "<2-LeftMouse>" },
--           open = "o",
--           remove = "d",
--           edit = "e",
--           repl = "r",
--           toggle = "t",
--         },
--         layouts = {
--           {
--             elements = {
--               { id = "scopes", size = 0.33 },
--               { id = "breakpoints", size = 0.17 },
--               { id = "stacks", size = 0.25 },
--               { id = "watches", size = 0.25 },
--             },
--             size = 0.33,
--             position = "right",
--           },
--           {
--             elements = {
--               { id = "repl", size = 0.45 },
--               { id = "console", size = 0.55 },
--             },
--             size = 0.27,
--             position = "bottom",
--           },
--         },
--         floating = {
--           max_height = 0.9,
--           max_width = 0.5, -- Floats will be treated as percentage of your screen.
--           border = vim.g.border_chars, -- Border style. Can be 'single', 'double' or 'rounded'
--           mappings = {
--             close = { "q", "<Esc>" },
--           },
--         },
--       },
--     },
--   }
-- end
--
-- M.setup = function()
--   local status_ok, dap = pcall(require, "dap")
--   if not status_ok then
--     return
--   end
--
--   if vim.use_icons then
--     vim.fn.sign_define("DapBreakpoint", vim.builtin.dap.breakpoint)
--     vim.fn.sign_define("DapBreakpointRejected", vim.builtin.dap.breakpoint_rejected)
--     vim.fn.sign_define("DapStopped", vim.builtin.dap.stopped)
--   end
--
--   dap.set_log_level(vim.builtin.dap.log.level)
--
--   if vim.builtin.dap.on_config_done then
--     vim.builtin.dap.on_config_done(dap)
--   end
-- end
--
-- M.setup_ui = function()
--   local status_ok, dap = pcall(require, "dap")
--   if not status_ok then
--     return
--   end
--   local dapui = require "dapui"
--   dapui.setup(vim.builtin.dap.ui.config)
--
--   if vim.builtin.dap.ui.auto_open then
--     dap.listeners.after.event_initialized["dapui_config"] = function()
--       dapui.open()
--     end
--     -- dap.listeners.before.event_terminated["dapui_config"] = function()
--     --   dapui.close()
--     -- end
--     -- dap.listeners.before.event_exited["dapui_config"] = function()
--     --   dapui.close()
--     -- end
--   end
--
--   local Log = require "vim.core.log"
--
--   -- until rcarriga/nvim-dap-ui#164 is fixed
--   local function notify_handler(msg, level, opts)
--     if level >= vim.builtin.dap.ui.notify.threshold then
--       return vim.notify(msg, level, opts)
--     end
--
--     opts = vim.tbl_extend("keep", opts or {}, {
--       title = "dap-ui",
--       icon = "",
--       on_open = function(win)
--         vim.api.nvim_buf_set_option(vim.api.nvim_win_get_buf(win), "filetype", "markdown")
--       end,
--     })
--
--     -- vim_log_level can be omitted
--     if level == nil then
--       level = Log.levels["INFO"]
--     elseif type(level) == "string" then
--       level = Log.levels[(level):upper()] or Log.levels["INFO"]
--     else
--       -- https://github.com/neovim/neovim/blob/685cf398130c61c158401b992a1893c2405cd7d2/runtime/lua/vim/lsp/log.lua#L5
--       level = level + 1
--     end
--
--     msg = string.format("%s: %s", opts.title, msg)
--     Log:add_entry(level, msg)
--   end
--
--   local dapui_ok, _ = xpcall(function()
--     require("dapui.util").notify = notify_handler
--   end, debug.traceback)
--   if not dapui_ok then
--     Log:debug "Unable to override dap-ui logging level"
--   end
-- end
--
-- return M
