return {
  "itchyny/calendar.vim",
  event = "VeryLazy",
  init = function()
    vim.g.calendar_google_calendar = 1
    vim.g.calendar_google_task = 1
    vim.g.calendar_google_api_key = "AIzaSyDeDt-Q4AF9JzodkrqzLqXIOWr-kQ-4zVI"
    vim.g.calendar_google_client_id = "1050436614474-7k1nnnetksbnufd2tkfis2vtl1hpp9k4.apps.googleusercontent.com"
    vim.g.calendar_google_client_secret = "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"
    vim.keymap.set("n", "<leader>cw", "<cmd>Calendar -view=week -split=vertical -width=60<cr>")
    vim.keymap.set("n", "<leader>cd", "<cmd>Calendar -view=day -split=vertical -width=60<cr>")
    vim.keymap.set("n", "<leader>cm", "<cmd>Calendar -view=month -split=vertical -width=60<cr>")
  end,
}
