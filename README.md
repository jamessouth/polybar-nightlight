<h1 align="center">polybar-nightlight</h1>

<p>&nbsp;</p>

A gamma control/blue light filter module for your

<div align="center">
	<picture>
 	 <source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/polybar/polybar/master/doc/_static/banner-dark-mode.png">
 	 <img alt="polybar logo" src="https://raw.githubusercontent.com/polybar/polybar/master/doc/_static/banner.png">
	</picture>
</div>

<p>&nbsp;</p>

<p align="center">
	<a href="https://github.com/jamessouth/polybar-nightlight/blob/master/LICENSE"><img src="https://img.shields.io/github/license/jamessouth/polybar-nightlight"></a>
	<a href="https://archlinux.org/"><img src="https://img.shields.io/badge/Linux-d.svg?logoWidth=40&labelColor=d35e49&color=E3C567&logoColor=000000&logo=Linux"></a>
	<a href="https://www.gnu.org/software/bash/manual/"><img src="https://img.shields.io/badge/Bash-d.svg?logoWidth=40&labelColor=4eaa25&color=293137&logoColor=ffffff&logo=GNU%20Bash"></a>
	<a href="https://www.x.org/wiki/"><img src="https://img.shields.io/badge/Xorg-d.svg?logoWidth=40&labelColor=f28834&color=000000&logoColor=ffffff&logo=X.Org"></a>
	<img src="https://img.shields.io/badge/awesome-%C6%94%F0%9D%9A%BA%C5%9E-235789.svg">
</p>
<p>&nbsp;</p>

## Description
This module provides the user with direct control (via `xrandr`) of their `X` display's gamma output to create a blue light filter/night shift effect. It does *not* depend on `redshift`. It uses Polybar's `ipc` function since there's no need to poll user settings, but I also show a way to do that. Wayland is not currently supported.
<p>&nbsp;</p>

## Installation
Install all of the scripts:
```bash
direc="$HOME/.config/polybar/timebar" && curl -JOL https://github.com/jamessouth/polybar-time-bar/blob/master/timebar.zip?raw=true && mkdir -pv $direc && unzip timebar.zip -d $direc && chmod -R +x $direc && rm timebar.zip
```
This will:
* set the `direc` variable to `.config/polybar/timebar`
* `curl` the zip file to your computer
* `mkdir` the directory stored in `$direc`
* `unzip` the archive into the directory
* `chmod +x` the scripts in the directory
* `rm` the zip file

Note that no-break spaces may need to be added to the Scroll and Time scripts as explained therein.
<p>&nbsp;</p>

## Usage
Please see the wiki.
<p>&nbsp;</p>







[[https://github.com/jamessouth/polybar-nightlight/blob/master/screenshot.gif|alt=clicking through profiles]]



## Usage
Simply click left/right to move among various `r:g:b` profiles. 

#### In your `config`:
```
[module/nightlight]
type = custom/ipc
hook-0 = ~/.config/polybar/scripts/nightlight.sh
hook-1 = ~/.config/polybar/scripts/nightlight.sh -
hook-2 = ~/.config/polybar/scripts/nightlight.sh +
format-prefix = 󰌵 
format-prefix-padding = 1
format-padding = 1
initial = 1
click-left = "#nightlight.hook.1"
click-right = "#nightlight.hook.2"
```

#### In your `bar`:
```
modules-left/center/right = ... nightlight ... 
enable-ipc = true
```

#### Data Persistence with `nightlight.sh`:
On the initial run, hook-0 is called (with no arg). If available, the script will use the value in `$XDG_DATA_HOME/nightlight`. Otherwise, it will use the last element of the `profiles` array and write the previously mentioned state file.

Left click calls hook-1 which passes `-` to the script. We're moving back through our list of profiles until we reach the beginning.

Right click calls hook-2 which passes `+` to the script. We're moving forward through the list of profiles until we can not continue.

The list of displays is hardcoded in the script's `displays` array. This could certainly stand to be made more dynamic.
