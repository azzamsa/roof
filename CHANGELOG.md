# Changelog

All notable changes to this project will be documented in this file.

## [0.1.0] - 2023-12-23

### ⛰️ Features

- Glitterize 💫 ([edaba33](https://github.com/azzamsa/roof/commit/edaba330596f194830bc0d5dcba8655c7b86de6b))
- Open Git status from directory ([514de41](https://github.com/azzamsa/roof/commit/514de4174348ecbcd7f35b56f8f7463b81cc02ff))

  The `oil` package prefixes its buffer with `oil://`.
  It must be sanitized before passing it to NeoGit.
  Otherwise, NeoGit will see it as an empty repository.

- Buff 💪 ([aefa6a5](https://github.com/azzamsa/roof/commit/aefa6a5350eb9d7be22b2117b1d2c6290508eb51))
- Always open Terminal in current directory ([fe268fd](https://github.com/azzamsa/roof/commit/fe268fdcaf2e251b95ceccc5e79bf85cb164fc32))

  Sometimes I want to open Terminal anywhere.

- Sparkle 🔮 ([dc3fb11](https://github.com/azzamsa/roof/commit/dc3fb113604ea522b5212f554824f81a677c3949))
- Project management ([2af8567](https://github.com/azzamsa/roof/commit/2af8567c750b3541eef6b14919ef51607799563e))

  Add a function to run from project root.
  Thanks to https://github.com/azzamsa/toor.

- Start everything from current buffer directory ([242b70a](https://github.com/azzamsa/roof/commit/242b70ab2d46017b4bf75a8451461ddd24f42162))

  In my workflow, I frequently switch between various projects and files, regardless of their location.
  I aim to replicate my Emacs workflow, where the Terminal serves as an extension of the editor,
  not the other way around.

  By the way, I start Neovim from Neovide. Not from the Terminal.

- Polish ✨ ([59627d2](https://github.com/azzamsa/roof/commit/59627d2af6c6382f3567e488b542ed28ca1d54e1))
- I want to go fishing! 🎣 ([75fd3e8](https://github.com/azzamsa/roof/commit/75fd3e8123e3c20f61df88bc01df8ccd7137375b))

  Based on https://github.com/LunarVim/Launch.nvim

- I want to have my own roof! 🏡 ([9d95e34](https://github.com/azzamsa/roof/commit/9d95e3462da8cfc84f17b3ec06359097113614d6))

  Based on https://github.com/LazyVim/LazyVim

### 🐛 Bug Fixes

- `vim-repeat` overrides colemak-dh remap ([dd72540](https://github.com/azzamsa/roof/commit/dd725400cd9efb3591c0bf47f7179e6e709dfdb7))

  Initially, I suspected `nvim-cmp` was causing the issue,
  as the `u` key reverted to `i` after selecting a completion candidate with `RET`.
  That's why I reported the problem [here](https://github.com/hrsh7th/nvim-cmp/discussions/1782).

  Upon further investigation using `:verbose map u`, it became evident that `vim-repeat` was resetting my `u` key back to `i`.

  Given that `leap` and `flit` heavily depend on `nvim-repeat`, I concluded that switching to `flash` was the optimal solution.
