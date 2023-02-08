if not pcall(require, "carbon-now") then
    return
end

require("carbon-now").setup({
    base_url = "https://carbon.now.sh/",
    open_cmd = "xdg-open",
    options = {
        theme = "vscode",
        window_theme = "none",
        font_family = "JetBrains Mono",
        font_size = "16px",
        bg = "gray",
        line_numbers = true,
        line_height = "133%",
        drop_shadow = false,
        drop_shadow_offset_y = "20px",
        drop_shadow_blur = "68px",
        width = "1000px",
        watermark = false,
    },
})
