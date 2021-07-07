library(hexSticker)

p <- here::here("man", "figures", "izipr_base2.png")
sticker(p,
        package = "", s_x = 1.1, s_y = .6, s_width = 1,
        s_height = 0.9,
        filename = "man/figures/izipr2.png",
        h_color = "#D52D12",
        url = "https://github.com/thomas-fung/izipr",
        u_size = 4, h_fill = "white"
)
