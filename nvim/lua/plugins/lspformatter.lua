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
						command = "$HOME/.local/share/nvim/mason/bin/php-cs-fixer",
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
					"pyright",
					"rust_analyzer",
					"html",
					"gopls",
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
			vim.lsp.enable("lua_ls")
			vim.lsp.enable("eslint")
			vim.lsp.enable("cssls")
			vim.lsp.config["emmet_language_server"] = {
				filetypes = { "html", "css", "php", "blade", "javascriptreact", "typescriptreact" },
				init_options = {
					html = {
						options = {
							["bem.enabled"] = true,
						},
					},
				},
			}
			vim.lsp.enable("emmet_language_server")
			vim.lsp.config["html"] = {
				filetypes = { "html", "php", "blade", "htm" },
				init_options = {
					configurationSection = { "html", "css", "javascript" },
					embeddedLanguages = {
						css = true,
						javascript = true,
					},
					provideFormatter = true,
				},
			}
			vim.lsp.enable("html")
			vim.lsp.config["phpactor"] = {
				root_dir = vim.loop.cwd(),
			}
			vim.lsp.enable("phpactor")
			vim.lsp.enable("clangd")
			vim.lsp.enable("pyright")
			vim.lsp.enable("rust_analyzer")
			vim.lsp.config["qmlls6"] = {
				cmd = { "qmlls6" },
				filetypes = { "qml" },
			}
			vim.lsp.enable("qmlls6")
			vim.lsp.enable("gopls")
			vim.lsp.enable("asm_lsp")

			vim.keymap.set(
				{ "n", "v" },
				"<leader>ca",
				vim.lsp.buf.code_action,
				{ silent = true, desc = "Show code action from configured LSP" }
			)
		end,
	},
}
