# polybar-nightlight &middot; ![](https://img.shields.io/badge/Linux-d.svg?logoWidth=48.25&labelColor=f6f6f6&style=for-the-badge&color=fcc624&logo=Linux) ![](https://img.shields.io/badge/bash-d.svg?logoWidth=41&labelColor=f6f6f6&style=for-the-badge&color=4eaa25&logo=GNU%20Bash) ![](https://img.shields.io/badge/Xorg-d.svg?logoWidth=43&labelColor=f6f6f6&style=for-the-badge&color=f28834&logo=X.Org)

Gamma control/blue light filter module for

[![Polybar](https://github.com/polybar/polybar/blob/master/banner.png)](https://github.com/polybar/polybar)


## Description
This module provides the user with direct control (via `xrandr`) of their `X` display's gamma output to create a blue light filter/night shift effect. It does *not* depend on `redshift`. It uses Polybar's `ipc` function since there's no need to poll user settings, but I also show a way to do that below. Wayland is not supported; it apparently does not have an equivalent to `xrandr`.

![screenshot](screenshot.gif)


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
