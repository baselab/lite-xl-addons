# Lite XL plugins

Plugins for the [Lite XL text editor](https://github.com/lite-xl/lite-xl)

If you can't find a plugin that suits your needs, check if someone has already
created one at [Lite XL plugins](https://github.com/lite-xl/lite-xl-plugins) or
opened an issue about it, otherwise feel free to create one yourself :)

## List of plugins

| Plugin                       | Description                 |
|------------------------------|-----------------------------|
| [`shfmt`](plugins/shfmt.lua) | Formatter for shell scripts |
| [`pyfmt`](plugins/pyfmt.lua) | Formatter for python code   |

## How to install

To install a plugin, drop the plugin `.lua` file directly in:

*   Linux `~/.config/lite-xl/plugins/`
*   MacOS `~/.config/lite-xl/plugins/`
*   Windows `C:\Users\(username)\.config\lite-xl\plugins\`

If the plugin consists in multiple files in a directory, copy the entire
directory.

Cloning the repo and make symlinks to the `lite-lx` plugin folder is a good
way to keep everything up-to-date with a simple `git pull`.

Another great way would be the use of the official
[`plugin_manager`](https://github.com/lite-xl/lite-xl-plugin-manager) and add
this git as repository:

```
lpm repo add https://github.com/baselab/lite-xl-addons.git:main
lpm plugin install <plugin-name>
```
