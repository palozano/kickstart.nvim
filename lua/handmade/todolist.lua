local M = {}

M.todolist = function()
	local query_string = '((comment) @comment (#match? @comment "TODO"))'
	local parser = require('nvim-treesitter.parsers').get_parser()
	local ok, query = pcall(vim.treesitter.query.parse, parser:lang(), query_string)
	if not ok then return end
	local tree = parser:parse()[1]
	local qf_list = {}
	for _, n in query:iter_captures(tree:root(), 0) do
		local text = vim.treesitter.get_node_text(n, 0)
		local lnum, col = n:range()
		table.insert(qf_list, {
			bufnr = vim.api.nvim_get_current_buf(),
			text = text,
			lnum = lnum + 1,
			col = col + 1,
		})
	end
	vim.fn.setqflist(qf_list)
	vim.cmd.copen()
end

return M
