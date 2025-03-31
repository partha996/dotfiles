#!/bin/sh

wall_path="swww img ~/dotfiles/wallpapers/"
Transition_style="--transition-pos 0.997,0.997 --transition-fps=60 --transition-type=outer"
declare -A wallpapers=(

	[deadpool]="$wall_path/deadpool.jpg $Transition_style"
	[hyprgirl]="$wall_path/hyprgirl.png $Transition_style"
	[colorPainting]="$wall_path/colorfulPainting.jpg $Transition_style"
	[eyes]="$wall_path/eyes.png $Transition_style"
	[scarletteWitch]="$wall_path/scarletteWitch.jpg  $Transition_style"
	[paintAot]="$wall_path/paintAot.jpg  $Transition_style"
	[mikasa]="$wall_path/mikasa.jpg  $Transition_style"
	[DarkAnimeGirl]="$wall_path/darkAnimeGirl.jpg  $Transition_style"
	[clearing]="$wall_path/clearing.png  $Transition_style"
	[bluehour]="$wall_path/bluehour.jpg  $Transition_style"
	[sky]="$wall_path/sky.png $Transition_style"
	[lol]="$wall_path/LeagueOfLegend.jpeg $Transition_style"
	[mario]="$wall_path/mario.gif $Transition_style"
	[alone]="$wall_path/alone.gif $Transition_style"
	[likeAGod]="$wall_path/likeagod.gif $Transition_style"
	[observer]="$wall_path/observer.png $Transition_style"
	[EveningPlan]="$wall_path/eveningPlan.jpg $Transition_style"
	[samurai]="$wall_path/samurai_strike.jpg $Transition_style"
	[streets]="$wall_path/street-tn.png $Transition_style"
)
choice=$(printf "%s\n" "${!wallpapers[@]}" | rofi -dmenu -p "Choose a wallpaper:" | xargs)

[ -n "$choice" ] && eval "${wallpapers[$choice]}"
