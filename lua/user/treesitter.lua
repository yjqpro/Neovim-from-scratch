local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({
	ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
	sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
	ignore_install = { "" }, -- List of parsers to ignore installing
	autopairs = {
		enable = true,
	},
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = function(lang, bufnr)
			return lang == "cpp" and vim.api.nvim_buf_line_count(bufnr) > 5000
		end,
		additional_vim_regex_highlighting = true,
	},
	indent = {
		enable = false,
		disable = { "yaml" },
	},
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
})
