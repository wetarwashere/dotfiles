return {
	{
		"mason-org/mason.nvim",
		config = function()
			require("mason").setup({
				ui = {
					border = "single",
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})
		end,
	},
	{
		"stevearc/conform.nvim",
		lazy = true,
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					html = { "prettier" },
					css = { "prettier" },
					javascript = { "prettier" },
					php = { "php-cs-fixer" },
					c = { "clang-format" },
					cpp = { "clang-format" },
					cs = { "clang-format" },
					python = { "black" },
					rust = { "rustfmt" },
					asm = { "asmfmt" },
					nasm = { "asmfmt" },
				},
				format_on_save = {
					timeout_ms = 500,
					lsp_format = "fallback",
				},
				formatters = {
					["php-cs-fixer"] = {
						command = "/home/wetar/.local/share/nvim/mason/bin/php-cs-fixer",
						args = {
							"fix",
							"--rules=@PSR12",
							"$FILENAME",
						},
						stdin = false,
					},
				},
				notify_on_error = true,

				vim.keymap.set("n", "<leader>fm", function()
					require("conform").format()
				end, { silent = true, desc = "Format current document" }),
			})
		end,
	},
	{
		"zapling/mason-conform.nvim",
		config = function()
			require("mason-conform").setup()
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"eslint",
					"cssls",
					"phpactor",
					"clangd",
					"emmet_language_server",
					"tailwindcss",
					"pyright",
					"rust_analyzer",
					"html",
					"gopls",
					"ts_ls",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"saghen/blink.cmp",
		},
		config = function()
			local lspconfig = vim.lsp
			local servers = {
				lua_ls = { filetypes = { "lua" } },
				eslint = { filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" } },
				ts_ls = { filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" } },
				cssls = { filetypes = { "css", "scss", "less" } },
				emmet_language_server = {
					filetypes = { "html", "css", "php", "blade", "jsx", "javascript", "typescript" },
					init_options = {
						html = {
							options = {
								["bem.enabled"] = true,
							},
						},
					},
				},
				html = {
					filetypes = { "html", "php", "blade", "htm" },
					init_options = {
						configurationSection = { "html", "css", "typescript", "javascript", "tsx" },
						embeddedLanguages = { css = true, javascript = true },
						provideFormatter = true,
					},
				},
				phpactor = { root_dir = vim.loop.cwd() },
				clangd = {},
				pyright = {},
				rust_analyzer = {},
				qmlls6 = { cmd = { "qmlls6" }, filetypes = { "qml" } },
				gopls = {},
				asm_lsp = {},
				tailwindcss = {},
			}

			for server, config in pairs(servers) do
				vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
					pattern = config.filetypes or "*",
					callback = function()
						if not vim.lsp.get_clients({ name = server })[1] then
							vim.lsp.enable(server, config)
						end
					end,
				})
			end

			vim.keymap.set(
				{ "n", "v" },
				"<leader>ca",
				vim.lsp.buf.code_action,
				{ silent = true, desc = "Show code action from configured LSP" }
			)
		end,
	},
}
