# force_reverse_video_cursor = true,
return {
        foreground = "#C5C9C7",
        background = "#14171d",

        cursor_bg = "#C5C9C7",
        cursor_fg = "#14171d",
        cursor_border = "#C5C9C7",

        selection_fg = "#C5C9C7",
        selection_bg = "#393B44",

        scrollbar_thumb = "#393B44",
        split = "#393B44",

        ansi = {
            "#14171d",
            "#C4746E",
            "#8A9A7B",
            "#C4B28A",
            "#8BA4B0",
            "#A292A3",
            "#8EA4A2",
            "#A4A7A4",
        },
        brights = {
            "#A4A7A4",
            "#E46876",
            "#87A987",
            "#E6C384",
            "#7FB4CA",
            "#938AA9",
            "#7AA89F",
            "#C5C9C7",
        },

tab_bar = {
	background = "#14171d", -- match overall background
	active_tab = {
		bg_color = "#393B44", -- match selection bg or scrollbar thumb
		fg_color = "#C5C9C7", -- match foreground
		intensity = "Bold",
		underline = "None",
		italic = false,
		strikethrough = false,
	},
	inactive_tab = {
		bg_color = "#1a1d23", -- slightly lighter than background
		fg_color = "#6c7086", -- muted gray-blue
	},
	inactive_tab_hover = {
		bg_color = "#2a2d33", -- hover highlight
		fg_color = "#C5C9C7",
		italic = true,
	},
	new_tab = {
		bg_color = "#1a1d23",
		fg_color = "#6c7086",
	},
	new_tab_hover = {
		bg_color = "#2a2d33",
		fg_color = "#C5C9C7",
		italic = true,
	},
}
}
