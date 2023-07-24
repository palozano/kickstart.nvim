local M = {}

M.grep_in_vim = function()
	-- User input to search
	local search = vim.fn.input("Search with vimgrep (**/*): ")
	-- Use vimgrep to search the input
	vim.cmd("vimgrep /" .. search .. "/gj **/*")
	-- Open the quickfix window
	vim.cmd("copen")
end

M.replace_in_quickfix_list = function()
	-- Ask for the replacement of the search
	local replace = vim.fn.input("Replace the search with (empty cancels): ")
	-- Return early if empty
	if replace == "" then return end
	-- Replace the search with the replacement
	vim.cmd("cfdo %s/" .. replace .. "/g | update")
end

return M
