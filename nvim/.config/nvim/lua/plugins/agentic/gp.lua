return {
  "robitx/gp.nvim",
  config = function()
    require("gp").setup({
      providers = {
        deepseek = {
          endpoint = "https://api.deepseek.com/v1/chat/completions",
          secret = os.getenv("DEEPSEEK_API_KEY"),
        },
      },

      default_chat_agent = "DeepSeek-Flash",
      default_command_agent = "DeepSeek-Flash",

      agents = {
        {
          name = "DeepSeek-Flash",
          chat = true,
          command = true,
          provider = "deepseek",
          model = "deepseek-v4-flash",   -- string, bukan tabel
          system_prompt = "You are a general AI assistant.",
        },
        {
          name = "DeepSeek-Pro",
          chat = true,
          command = true,
          provider = "deepseek",
          model = "deepseek-v4-pro",     -- string, bukan tabel
          system_prompt = "You are a general AI assistant.",
        },
      },
    })

    -- (Opsional) Shortcuts dasar
    vim.keymap.set({ "n", "i" }, "<leader>gc", ":GpChatNew<CR>", { desc = "New chat with default agent" })
    vim.keymap.set({ "n", "i" }, "<leader>gC", ":GpChatNew agent=DeepSeek-Pro<CR>", { desc = "New chat with DeepSeek-Pro" })
  end,
}
