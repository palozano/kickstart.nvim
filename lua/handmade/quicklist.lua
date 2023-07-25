local M = {}

M.vimgrep_ui = function()
	vim.ui.input({ prompt = 'Search with vimgrep (**/*) [empty cancels]: ' },
		function(search)
			-- Return early if empty
			if search == "" or search == nil then
				return
			end
			-- Use vimgrep to search the input
			vim.cmd("vimgrep /" .. search .. "/gj **/*")
			-- Open the quickfix window
			vim.cmd("copen")
		end)
end

M.replace_in_quickfix_list = function()
	-- Ask for the replacement of the search
	vim.ui.input({ prompt = "Replace [empty cancels]: " },
		function(search)
			-- Return early if empty
			if search == "" or search == nil then
				return
			end

			vim.ui.input({ prompt = "Replacing '" .. search .. "' with [empty cancels]: " },
				function(replace)
					-- Return early if empty
					if replace == "" or replace == nil then
						return
					end
					-- Replace the search with the replacement
					vim.cmd("cfdo %s/" .. search .. '/' .. replace .. "/ge | update")
				end)
		end)
end

return M
