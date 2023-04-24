local dap = require('dap')

-- CodeLLDB debug adapter location
local codelldb_path = vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/adapter/codelldb"
if vim.fn.has("win32") then
    codelldb_path = vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/adapter/codelldb.exe"
end


dap.adapters.codelldb = {
    type = 'server',
    port = "${port}",
    executable = {
        -- CHANGE THIS to your path!
        command = codelldb_path,
        args = { "--port", "${port}" },
        -- On windows you may have to uncomment this:
        detached = false,
    }
}
dap.configurations.rust = {
    {
        name = "Launch file",
        type = "codelldb",
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/', 'file')
        end,
        args = function()
            local out = {}
            local argString = vim.fn.input("Args sperated by ',' :")
            out = SplitString(argString, ',')
            return out
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
    },
}

require("dapui").setup()

function SplitString (inputstr, sep)
        if sep == nil then
                sep = "%s"
        end
        local t={}
        for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
                table.insert(t, str)
        end
        return t
end

