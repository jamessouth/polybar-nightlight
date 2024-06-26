<p align="center">
	<picture>
        <source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/jamessouth/polybar-nightlight/master/imgs/title_dark.jpg">
        <img alt="polybar-nightlight" src="https://raw.githubusercontent.com/jamessouth/polybar-nightlight/master/imgs/title.jpg">
    </picture>
</p>

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

<p>
	<picture>
        <source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/jamessouth/polybar-nightlight/master/imgs/desc_dark.jpg">
        <img alt="description" src="https://raw.githubusercontent.com/jamessouth/polybar-nightlight/master/imgs/desc.jpg">
    </picture>
</p>

This module provides a blue light filter/night shift effect for `X` displays. It:
* uses polybar's `ipc` function
* calls the `xrandr` command to change the gamma output
* does *not* depend on `redshift`
* can be automated to run on a schedule

<img alt="clicking through rgb profiles" src="imgs/screenshot.gif">
<p>&nbsp;</p>

<p>
	<picture>
        <source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/jamessouth/polybar-nightlight/master/imgs/inst_dark.jpg">
        <img alt="installation" src="https://raw.githubusercontent.com/jamessouth/polybar-nightlight/master/imgs/inst.jpg">
    </picture>
</p>

```bash
fn="$HOME/.config/polybar/nightlight.sh" && curl -o $fn https://raw.githubusercontent.com/jamessouth/polybar-nightlight/master/nightlight.sh && chmod +x $fn
```
This will:
* set the `fn` variable to `~.config/polybar/nightlight.sh`
* `curl` the script to that location
* `chmod +x` the script to make it executable
<p>&nbsp;</p>

<p>
	<picture>
        <source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/jamessouth/polybar-nightlight/master/imgs/usage_dark.jpg">
        <img alt="usage" src="https://raw.githubusercontent.com/jamessouth/polybar-nightlight/master/imgs/usage.jpg">
    </picture>
</p>

Please see the wiki.
<p>&nbsp;</p>

## My other polybar modules
Please check out:
  * [polybar-time-bar](https://github.com/jamessouth/polybar-time-bar)
  * [polybar-binary-clock-fonts](https://github.com/jamessouth/polybar-binary-clock-fonts)
<p>&nbsp;</p>
