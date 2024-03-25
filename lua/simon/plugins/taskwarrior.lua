return {
  {
    "huantrinh1802/m_taskwarrior_d.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    config = function()
      require("m_taskwarrior_d").setup()
    end

  }
}
