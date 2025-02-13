local rpc = require 'rpc'

--- @param lsp LSP
--- @return boolean
return function (lsp)
    local ws = lsp.workspaces[1]

    if ws then
        -- 请求工作目录
        local uri = ws.uri
        -- 请求配置
        rpc:request('workspace/configuration', {
            items = {
                {
                    scopeUri = uri,
                    section = 'Lua',
                },
                {
                    scopeUri = uri,
                    section = 'files.associations',
                },
                {
                    scopeUri = uri,
                    section = 'files.exclude',
                }
            },
        }, function (configs)
            lsp:onUpdateConfig(configs[1], {
                associations = configs[2],
                exclude      = configs[3],
            })
        end)
    end

    rpc:request('client/registerCapability', {
        registrations = {
            -- 监视文件变化
            {
                id = '0',
                method = 'workspace/didChangeWatchedFiles',
                registerOptions = {
                    watchers = {
                        {
                            globPattern = '**/',
                            kind = 1 | 2 | 4,
                        }
                    },
                },
            },
            -- 配置变化
            {
                id = '1',
                method = 'workspace/didChangeConfiguration',
            }
        }
    }, function ()
        log.debug('client/registerCapability Success!')
    end)

    return true
end
