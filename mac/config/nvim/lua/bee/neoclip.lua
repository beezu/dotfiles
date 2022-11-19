local neoclip_status_ok, neoclip = pcall(require("neoclip"))
if not neoclip_status_ok then
	return
end

-- local status_ok, sqlite = pcall(require('sqlite'))
--   if not status_ok then
--   return
-- end

-- local db = sqlite {
--   uri = "~/.local/share/nvim/databases/neoclip.sqlite3",
--   projects = {
--     objectives = "luatable",
--     title = { "neoclip", unique = true, primary = true },
--     created = { "timestamp", default = sqlite.lib.strftime("%s", "now")},
--     done = "boolean"
--   },
-- }

-- sqlite.setup {
--   module = 'sqlite',
-- }

neoclip.setup({
	history = 1000,
	enable_persistent_history = false,
	length_limit = 1048576,
	--  continuous_sync = true,
	-- db_path = "~/.local/share/nvim/databases/neoclip.sqlite3",
	--  filter = nil,
	preview = true,
	--  prompt = nil,
	--  default_register = 'r',
	--  default_register_macros = 'f',
	enable_macro_history = true,
	--  content_spec_column = false,
	--  on_paste = {
	--    set_reg = false,
	--  },
	--  on_replay = {
	--    set_reg = false,
	--  },
	keys = {
		telescope = {
			i = {
				select = "<cr>",
				paste = "<C-p>",
				paste_behind = "<C-k>",
				replay = "<C-q>", -- replay a macro
				delete = "<C-d>", -- delete an entry
				custom = {},
			},
			n = {
				select = "<cr>",
				paste = "p",
				--- It is possible to map to more than one key.
				-- paste = { 'p', '<c-p>' },
				paste_behind = "P",
				replay = "q",
				delete = "d",
				custom = {},
			},
		},
	},
})
