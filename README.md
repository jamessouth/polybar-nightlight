# polybar-nightlight &middot; ![](https://img.shields.io/badge/Linux-d.svg?logoWidth=48.25&labelColor=f6f6f6&style=for-the-badge&color=fcc624&logo=Linux) ![](https://img.shields.io/badge/bash-d.svg?logoWidth=41&labelColor=f6f6f6&style=for-the-badge&color=4eaa25&logo=GNU%20Bash) ![](https://img.shields.io/badge/Xorg-d.svg?logoWidth=43&labelColor=f6f6f6&style=for-the-badge&color=f28834&logo=X.Org)

Gamma control/blue light filter module for

[![Polybar](https://github.com/polybar/polybar/blob/master/banner.png)](https://github.com/polybar/polybar)


## Description
This module provides the user with direct control (via `xrandr`) of their `X` display's gamma output to create a blue light filter/night shift effect. It does *not* depend on `redshift`. Simply click left/right to move between your various 'profiles' of `r:g:b`. It uses `ipc` since there's no need to poll user settings, but I have provided a way to do that as well. Wayland is not supported; it apparently does not have an equivalent to `xrandr`.

![screenshot](screenshot.png)

## Usage

#### In your `config`:

```
[module/nightlight]
include-file = /home/username/.config/polybar/nightlight
```

#### In your `bar`:

```
modules-left/center/right = ... nightlight ... 
enable-ipc = true
```

#### `nightlight`:

The hooks call `nlscript.sh`, passing in:
* `nlindex`
* `nldata`
* `+` or `-` to move up or down your list of profiles
* the name(s) of your display(s) (run `xrandr` to get their names)

I only have a laptop so I have not tested multiple monitors. I think passing in additional display names and uncommenting the corresponding `xrandr` calls in `nlscript.sh` should work. 

#### `nldata`:

A list of `red:green:blue` profiles lightly adapted from [here](https://askubuntu.com/questions/1003101/how-to-use-xrandr-gamma-for-gnome-night-light-like-usage).

#### `nlindex`:

Stores the index of the current profile. 

#### `nlscript`:

Sets the new index according to your `+` or `-` input, with a min of 1 and max of length of `nldata`. Sets the new gamma value, updates the index, and echoes the new value to Polybar.

#### In your `bspwmrc` or similar (optional):

```
wc -l ~/.config/polybar/nldata | cut -d' ' -f1 > ~/.config/polybar/nlindex
```
This will reset your `nlindex` on startup to be the number of lines in `nldata`, which will set your gamma to your last profile. Here that is the default `1:1:1` so as to start the day fresh and bright with no blue light filter effect.

## If you would rather not use `ipc` and want instead to poll the module at an interval...

The script calls in the hooks of the `nightlight` module can be keybound so you can adjust the `nlindex` that way:
#### In your keybinding file:
```
super + r
        bash ~/.config/polybar/nlscript.sh ~/.config/polybar/nlindex ~/.config/polybar/nldata + eDP-1
```

#### Comment out the last line of `nlscript` since you won't need to echo to Polybar.
```
...
echo ${new_index} > "$indexFile"
#echo ${gamma}
```
#### Use a custom/script module:
```
type = custom/script

exec = xrandr --verbose | grep Gamma | cut -d' ' -f7-
interval = 2
format = <label>
format-prefix = "nl "
format-font = 1
format-foreground = ${colors.steel}
label = %{T1}%output%
```

This example directly calls `xrandr`. This works, but the output of `xrandr` is the inverse (1/x) of the gamma value you use, rounded to the nearest tenth, so your value won't be what you see in Polybar. To show the value you submitted, you can re-invert the `xrandr` output, but it only returns values rounded to tenths, so the inverse won't generally be what you submitted. For example, if you set the blue value to 0.42, `xrandr` will show it as 2.4 (1/0.42 rounded). If you invert that for display (say, with `awk`), you will get 0.416666..., not exactly the value you set. One way to deal with this would be to use a separate getter script like this...:
```
indexFile="$1"

dataFile="$2"

index=$(cat "$indexFile")

echo $(sed -n "${index}"p "$dataFile")

```

instead of executing `xrandr` directly...:
```
exec = ~/.config/polybar/nlgetter.sh
```

## Keyboard control of ipc module

I tried to find an easy, no-dep way to simulate a mouse click on the hit area of a Polybar module but I wasn't able to. There are packages such as `xdotool` and `xautomation` that can be used. To get the hit area of a module run Polybar with `trace`-level logging and mouse over it. You should then be able to determine a bounding box for use with such tools. Also see Mouse Keys on the [ArchWiki Accessibility page](https://wiki.archlinux.org/title/Accessibility#Mouse_keys). Mouse Keys is an easy way to control the mouse with the keyboard.
