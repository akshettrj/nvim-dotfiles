local ls = require('luasnip')

local avail_filetypes = {
    "all"
}

-- Functions

local function print_date(_, snippet, format)
    return os.date(format)
end

local function execute_command(_, snippet)

    local command = ""

    if snippet.captures[1] then
        command = snippet.captures[1]
    else
        return { "No command provided" }
    end

    local pfile = io.popen(command, "r")
    local response = { '$ ' .. command }

    for line in pfile:lines() do
        table.insert(response, line)
    end

    return response
end

-- Snippets

local current_date_snippet = ls.snippet (
        { trig = "date", regTrig = false },
        ls.function_node (print_date, {}, "%d/%m/%Y")
    )

local command_execution_snippet = ls.snippet (
        { trig = "zsh (.*)", regTrig = true },
        ls.function_node (execute_command, {})
    )

local avail_snippets = {
    current_date_snippet,
    command_execution_snippet
}

for _, ftp in ipairs(avail_filetypes) do

    if not ls.snippets[ftp] then
        ls.snippets[ftp] = {}
    end

    for _, snip in ipairs(avail_snippets) do
        table.insert(ls.snippets[ftp], snip)
    end

end
