

beta_df <- data.frame(p = seq(0,1, length=100)) |> 
  mutate(a = dbeta(p, 2, 10),
         b = dbeta(p, 2, 5),
         c = dbeta(p, 2, 2)) |> 
  tidyr::pivot_longer(cols = a:c, values_to = "b")


library(ggplot2)

ggplot(beta_df, aes(x = p, y = b, color = name)) + 
  geom_line(linewidth = 2, alpha = 0.8) +
  theme_linedraw() +
  guides(color = "none") +
  scale_color_manual(values = c("#e63e62", "#ff8f00", "#ffdf00")) +
  coord_cartesian(xlim = c(0, 1), ylim = c(0, 4.5), expand = FALSE) + 
  #xlim(0,1) +
  #ylim(0, 4.5) +
  theme(axis.title = element_blank(),
        axis.ticks = element_blank(),
        axis.text = element_blank(),
        panel.grid.minor = element_blank(),
        panel.grid.major = element_line(linewidth = 0.3, color = "gray35"))

ggsave("img/nccc_logo.png", width = 400, height = 400, units = "px")
