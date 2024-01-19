return {
    "alexandersix/vim-blade",
    config = function()
        -- blade setup
        vim.filetype.add({
            pattern = {
                ['.*%.blade%.php'] = 'blade',
            }
        })

        -- NOTE: make sure the tables for directives below are not empty
        -- otherwise it causes issues
        --[[ --example: { 'include', 'session' }
        vim.g.custom_blade_directives = {}

        vim.g.blade_custom_directives_pairs = {
            --example: if = 'endif'
        }
     ]]
    end
}
