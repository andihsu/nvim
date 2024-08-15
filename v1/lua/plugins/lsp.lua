require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require("mason-lspconfig").setup({
    ensure_installed = {
        "luau_lsp",
        "rust_analyzer",
        "zls",
        "clangd"
    },
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("lspconfig").zls.setup {
    capabilities = capabilities,
}
require("lspconfig").rust_analyzer.setup {
    capabilities = capabilities,
}
