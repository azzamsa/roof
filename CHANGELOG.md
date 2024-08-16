# Changelog

All notable changes to this project will be documented in this file.

## [1.0.0] - 2024-08-16

### 🚚 Migrations

- From `Iosevka` to `JetBrains Mono`. ([1d6887e](https://github.com/azzamsa/roof/commit/1d6887ee44aaaf1d68b17a3324894279463fd256))

  I'm on the quest for a font that excels in legibility.
  Initially, I thought I might give `Intel Mono` a shot,
  but unfortunately, it didn't meet my expectations—it looked quite awful.
  I desire a font that is not only legible but also aesthetically pleasing.

  After a solid two days of exploration, I always find myself coming back to `Iosevka`.
  Other fonts I tried seemed too bold for my taste.
  However, something intrigued me: GitHub stargazers.
  I noticed that `Iosevka` had only 17k stars compared to the massive 73k stars for `Fira Code`.

  After a bit more searching, the most frequently mentioned fonts were
  `Iosevka`, `Cascadia Code`, and `JetBrains Mono`.

  By the end of the second day, I still couldn't decide which font was superior to `Iosevka`.
  However, after reading some comments regarding the increased height of `JetBrains Mono`,
  I meticulously tried each popular font one by one.

  Why not `Iosevka`:
  - Some characters look similar.
  - Too condensed (I'm aware of the Extended version, but I'm seeking a taller/heavier font).

  Why not `Intel Mono`:
  - It looks awful and too extended.

  Why not `Cascadia Code`:
  - I love that it's stronger than other fonts; however, it's still smaller than `JetBrains Mono`.

  Why not `Recursive`:
  - Some characters look similar.
  - Smaller than `JetBrains Mono`.

  Why `JetBrains Mono`? ⛳
  - The x-height of `JetBrains Mono` is larger, making it more legible.
  - Simple design.
  - Astounding range of 138 coding ligatures.

### ⛰️ Features

- Notify on successful copy ([3c023ca](https://github.com/azzamsa/roof/commit/3c023cad019417178518a876e6ba115bef684f5d))

  I don't need that fancy keyboard!

- Support svelte develompent ([03d4c72](https://github.com/azzamsa/roof/commit/03d4c72fa4000c494df805d8f587ce57cc5b7e33))
- Beautiry markdown files ([80ecffc](https://github.com/azzamsa/roof/commit/80ecffc330e45310e5d9c1b71fee7590719a970d))
- Hide uninteresting files in sidebar ([92b5015](https://github.com/azzamsa/roof/commit/92b5015ad4c6d345fbe3eb4cb7778fc3e505f168))
- Adopt which-key v3 ([9c5fd8c](https://github.com/azzamsa/roof/commit/9c5fd8c1892fd403e63fc7245c481d8b43a1596d))
- Save buffer as root ([61aa962](https://github.com/azzamsa/roof/commit/61aa962a80c86635759f9583e4cbeac928ed94f1))
- Ron filetype ([d2a11ec](https://github.com/azzamsa/roof/commit/d2a11ecb5ff2127e211ef6b82ca27f9a8180dda8))
- Revert buffer ([8c1bfe0](https://github.com/azzamsa/roof/commit/8c1bfe0350459096ed2dd1cdfa1cb4950bb7eb56))
- Support hurl ([0e4c174](https://github.com/azzamsa/roof/commit/0e4c1741053c61619e3dc24586e885abf16cf00a))
- Close NeogitConsole buffer with `q` ([51ba258](https://github.com/azzamsa/roof/commit/51ba258a124f15e13a15d19edbf0ebe6c32aa209))
- Migrate `neogit` from `mnei` to `neio` ([cc04b57](https://github.com/azzamsa/roof/commit/cc04b57b139a30083703c9d48489818a2b42ff1d))
- Support typst ([67a5cf8](https://github.com/azzamsa/roof/commit/67a5cf8ffd6fa8ff799fbc43c9d82f09de9a536f))
- More Doom Emacs keybindings ([9a382d6](https://github.com/azzamsa/roof/commit/9a382d601d906ac320a4b50d58d50e8181ac54b9))
- Let mason manage `biome` ([ada86e5](https://github.com/azzamsa/roof/commit/ada86e56db6742cc7094000a921d61fca5f7f66b))
- Use same keybindings in `neo-tree` and `oil` ([378f234](https://github.com/azzamsa/roof/commit/378f234c6bb6735fc3b345c4677c391c0acab8bd))

  To minimize context switching. I don't want to memorize too much keys.

- Migrate from `mnei` to `neio` ([b3d76cd](https://github.com/azzamsa/roof/commit/b3d76cdac3bf4c14140c02d5ef3a4797a307c7ae))
- Add more catppuccin integrations ([0bc89ee](https://github.com/azzamsa/roof/commit/0bc89eea95f9e197049df944eae9e1f085f323dd))
- Enable homogenous keybinding in oil ([0eb4525](https://github.com/azzamsa/roof/commit/0eb452516e76fc1414c5a90eed2ef815a0e4a617))

  In normal buffer `C-s` is write buffer.

- Setup for web develpment ([10614b7](https://github.com/azzamsa/roof/commit/10614b704f87a0adcb35a2b770d2e9807422abd1))
- Support `xdg-open` in `Oil` buffer. ([9825d16](https://github.com/azzamsa/roof/commit/9825d169e397b04c0023cd623baac1b3ded31d20))
- Kanagawa theme ([ff7cfa4](https://github.com/azzamsa/roof/commit/ff7cfa484b6f2fde2008d9e534448cf9be0d7902))
- Turn more knobs ([eb1ec25](https://github.com/azzamsa/roof/commit/eb1ec25d3f418f9ec1159f3cac8c689d271d915e))
- Setup `nushell` syntax highlighting ([7c5af88](https://github.com/azzamsa/roof/commit/7c5af888ba6f0ec81feced202663d0f9ef3599f6))

  At the same time I remove all unnecessary configurations.
  All of them comes from LunarVim (base config of this repo).

- Pull my contributions from `stevearc/conform` ([557ffdc](https://github.com/azzamsa/roof/commit/557ffdc6057912b8d8e118d129b307ae6d3cd2a9))

  - https://github.com/stevearc/conform.nvim/pull/264
    - https://github.com/stevearc/conform.nvim/pull/263

- Whoopee 🎉 ([edb38b3](https://github.com/azzamsa/roof/commit/edb38b327fd4390e72f004c13554989b421db821))

  - A bug arose due to a lack of atomicity in a function.
    - The function, named `cwd()`, also handles path validation.
    - Consequently, validation is scattered across various functions: `path()`, `cwd()`, `project_root()`, all of which include a call to `validation()`.
    - This leads to confusion and complexity.
    - The suggestion is to adhere strictly to the function's name. Perform only what the function name implies – either return the current directory or the current absolute path.
    - After obtaining the result, invoke a separate validation step, like `validate(cwd())`, to enhance clarity.
    - Duplications such as `validate(cwd())` and `validate(path())` are acceptable. They serve as clear indicators that only one action is being performed in each step. Alternatively, consider more descriptive function names like `validated_path()` or `clean_cwd()`.

- Snazzy ✨ ([c1ec55d](https://github.com/azzamsa/roof/commit/c1ec55d48df2aba90acdea7516ca8de11daa4306))
- Steven Arcangeli (stevearc) 🌱 ([7c411aa](https://github.com/azzamsa/roof/commit/7c411aa69dbc25b57580700ea6bc5d6401cb1833))

  Thank you Steven for your contributions to Neovim community!

- Use `Tokyo Night` theme ([c18517c](https://github.com/azzamsa/roof/commit/c18517c20b8f36aa917699e33ccf2d83fafc5c97))

  The moon variant is more readable than other.

- Support nunjucks development ([8017160](https://github.com/azzamsa/roof/commit/80171609c78d88de61e394a60448982353aaeacd))
- Close scratch buffer if it is currently open ([4b730f8](https://github.com/azzamsa/roof/commit/4b730f81ce0636461970fb059eb5dfc18f65bd48))
- Replace `luacheck` with `selene` ([624ba5e](https://github.com/azzamsa/roof/commit/624ba5e86ce7af2ab7d1f7c9685f1d4e5dcad4d7))

  It is better than `luacheck`. Even the `Neovim` project uses it.

- Folke Lemaitre (folke) 🌱 ([494e666](https://github.com/azzamsa/roof/commit/494e66649ef5b86942d1fd4195e9d367267e25be))

  Why settle for random words when we can celebrate our Neovim heroes?
  Drumroll, please! Who's next in the Hall of Code Fame? 🚀

- Glorious 🌟 ([2e76763](https://github.com/azzamsa/roof/commit/2e76763bae2cee7790edcbfbb230adf794d7a6d6))
- Open `oil` from `Telescope file_browser` ([f312a12](https://github.com/azzamsa/roof/commit/f312a1297d072af82c0fef0475f009351e8d5fdc))

  I'm having a hard time configuring this.
  It turns out I need to call `actions.close(prompt_bufnr)` before invoking `oil.open()`.
  Otherwise, `oil` will issue a warning about an unsaved buffer.

- Snazzy ✨ ([cf9b770](https://github.com/azzamsa/roof/commit/cf9b7703f17c878497fed1d72f2de1f82166f390))
- Shine 🌠 ([fc4f06f](https://github.com/azzamsa/roof/commit/fc4f06f9f68d49bc9e52121eb1d0e8265ecd9995))
- Open `toggleterm` from oily path ([1f0efc0](https://github.com/azzamsa/roof/commit/1f0efc0d8c3a1f952d52dfa20854e9127586d846))

  Oily is a term I coined for a invalid path that contains additional
  prefix. Such as `Oil://..`.

- Copy **any** file path ([8535d52](https://github.com/azzamsa/roof/commit/8535d523cafb4a507c6aba00933f961ff8492631))

  Including the `Oil.vim` buffer.
  A helper function is needed to enable this key to work in the `Oil.nvim` buffer.

- Glisten 🌞 ([75d7b56](https://github.com/azzamsa/roof/commit/75d7b5649ec1a3a9d568a8d7c838e49e2b2591d9))
- Radiate 🌞 ([1c8f0b5](https://github.com/azzamsa/roof/commit/1c8f0b5476030d3d08305a3ce77cc480919601ab))
- Blingify 💎 ([a38d42c](https://github.com/azzamsa/roof/commit/a38d42c66a7235d5d8a207236ab3dbcb64ca8b7d))

### 🐛 Bug Fixes

- Update keybindings ([e567fe9](https://github.com/azzamsa/roof/commit/e567fe9bf9abdb7b1810844083701e4fe2a22d02))
- Update code action key ([141261c](https://github.com/azzamsa/roof/commit/141261c6cf1c1e9c6b7f9bf069611c46d9cda0e8))
- `rg` and `toor` don't work with directories containing parentheses ([481c4eb](https://github.com/azzamsa/roof/commit/481c4eb22ef1494b944155d216a25e3e6fcb2ea9))

  SvelteKit directories uses parentheses for their naming conventions.

- I prefer to read markdown in raw mode ([2d97177](https://github.com/azzamsa/roof/commit/2d9717785d1506a538d3f6b32fcbacd4afe9a970))

  It is easier to read.

- Add missing keybindings ([a243dec](https://github.com/azzamsa/roof/commit/a243decef48a0cda15dc1792e1f10a105b4bf561))
- Use default key for `tardis` ([26f7d72](https://github.com/azzamsa/roof/commit/26f7d72de2f13fb7517a8051c88790a271cbd09b))
- Nested keymap is not supported in which-key v3 ([b4e84e8](https://github.com/azzamsa/roof/commit/b4e84e86aa9df069d02fd7fa135667c17f8c4c17))

  - https://github.com/folke/which-key.nvim/discussions/717

- Lualine able to detect theme automatically ([ca131d9](https://github.com/azzamsa/roof/commit/ca131d95db75ddb7ed1ceea075aed4be6507a9ff))
- `Invalid plugin spec { "" }` ([3a2d9f3](https://github.com/azzamsa/roof/commit/3a2d9f3b2af44ec0ad4a69e631290c67406c2522))
- Disable outdated dependency notification ([166e211](https://github.com/azzamsa/roof/commit/166e2118974c8c0a6cac075822cbaf6f291d296c))

  I don't want to life in the bleeding edge environment.

- Insert in current line ([5bbd9a7](https://github.com/azzamsa/roof/commit/5bbd9a755f112bf60316fc522e72e7e73c75553c))
- Migrate `indent-blankline` to v3 ([ac06586](https://github.com/azzamsa/roof/commit/ac065864f8398d0efcb357c9e05d15bb90d767d2))
- Remove hard-coded commit hash ([8cc6193](https://github.com/azzamsa/roof/commit/8cc6193c2786bab8b3574e22d54a11d34cab2440))

  I don't want to change each commit hash manually in each upgrade.
  The best approach is the "stable" tag.

- Disable saviour notifications ([d3997d9](https://github.com/azzamsa/roof/commit/d3997d9e71a4f07e96985546a42aca3c1a1eef9d))

  They're pointless.
  I'm already aware of whether a buffer has been saved or not.

- Can't use `C-o` to go back from `jump to definition` ([1931a59](https://github.com/azzamsa/roof/commit/1931a59db559a8a23922a8902348874c666ca798))

  Turns out it was replaced by a custom command.
  I need `go back from definition` more often than `go up/down window`.
  So, It is a wise decision to revert it back and use other key for window
  movement.

- Pin `mini.comment` ([250a146](https://github.com/azzamsa/roof/commit/250a1462e7ae7343f91917da1b8e46cc1801919f))
- Use friendlier keybindings for surround actions ([55e5059](https://github.com/azzamsa/roof/commit/55e5059432fde351a660cd794be186391b682b46))

  `gzz..` is too long and often confusing.

- I can't differ between `vim-illuminate` and highlighted word ([1b127ee](https://github.com/azzamsa/roof/commit/1b127ee6001d06bfcc5af9daa917f3c3b94db473))

  It is so annoying, I can't spot the difference between them easily.
  To go to other matching word, instead of `[[` or `]]`, I can use `*`.

- I don't use nushell anymore ([37a740a](https://github.com/azzamsa/roof/commit/37a740a9fc56d17e691ec50ac80df0a84b6138d4))
- I rarely use `/` from bookmarks. ([6b7b530](https://github.com/azzamsa/roof/commit/6b7b530e32252f3f001d846f09a515defa990e00))

  Also, I use other editor for sudo owned files.
  Currently, I can't find a good way to edit sudo owned files with
  Neovide.

- Use more robust auto-save mechanism ([ad72f90](https://github.com/azzamsa/roof/commit/ad72f9093f980248496eea9b35981f151f6dc1c0))

  Using simple autocmd is not on par with Emacs's `bbatsov/super-save`.

- Use 'commit hash' for repos I regularly contribute to ([1eab100](https://github.com/azzamsa/roof/commit/1eab100f4281a04622185f43d83f85ce282ef9b3))
- Mocha's surface0 is too dimmed on macchiato base ([8aed100](https://github.com/azzamsa/roof/commit/8aed100bda43ba695db9eab12f7ca67211a4b594))
- Enable `multicursors.nvim` hint to avoid losing focus ([af502be](https://github.com/azzamsa/roof/commit/af502bed51e90fb09a30d5dcb67d2be441748a85))

  I don't need the hint from `multicursors.nvim`.
  It takes up screen space on large sizes and is unnecessary on small sizes.
  However, without the hint, on rare occasions when there is only one match,
  it loses focus when I press `n` (next match).

- Nvim Telescope can't handle big recent files ([f906a7a](https://github.com/azzamsa/roof/commit/f906a7a25c34bb6ac24a512ffa4f3c818c38a48e))

  Unlike Emacs, where I'm accustomed to jumping anywhere using a huge list of recent files,
  Nvim/Telescope is noticeably slow, even with only 200 recent files.

- Non-NerdFont + Nerd symbol has ugly glyph in modeline ([51041c7](https://github.com/azzamsa/roof/commit/51041c7d8440c3216cd418255c7f20dffcea2cad))
- `vim-notify` doesn't respect timeout value ([682b095](https://github.com/azzamsa/roof/commit/682b095b6b47228b648864d917579c9ba9c672a0))

  Timeout will never work if `stages` is set to anything other than `static`

- `<c-c><c-k>` doesn't work. ([e3d9a12](https://github.com/azzamsa/roof/commit/e3d9a121389c8689a7f707f5c5cbd642cfb8c9a4))

  `<c-c><c-k>` has never worked on my end. I need to replace it with something else.

- `nvim-colorizer` is not loaded ([4af55fc](https://github.com/azzamsa/roof/commit/4af55fcbb1d303c1f90479e9877425e3d0ea7833))
- Show hidden files by default ([266a580](https://github.com/azzamsa/roof/commit/266a58053d9ca292f8ef1f9b6e8c3b589171bafb))

  Show hidden files by default. Most of them are important in my case.
  Things like `dotfiles/.configs/*` are crucial.
  I can put uninteresting files under `.ignore` if I wish.

- 1000 recent files was to big for Telescope ([7720a6b](https://github.com/azzamsa/roof/commit/7720a6b5075b69122e968cb07809b7c9004c3373))

  I start noticing the slowness.

- `Neogit` must be run from root directory ([4d87aad](https://github.com/azzamsa/roof/commit/4d87aad6098e80303a6c0a5465d024d00d36a5bc))

  Neogit must be executed from root directory! ⚠️

  While using the directory path functions correctly for Git commit and Git status,
  it encounters issues during hunk and file visit operations. For these operations,
  `Neogit` necessitates functioning from the `.git` (root) directory.

- Don't check new version of dependencies ([a308150](https://github.com/azzamsa/roof/commit/a30815067e9cde92da32ed5c792da0065e1734d3))

  Currently, Neovide stuck when there is a notification at the startup.

- Format Rust files with `Cargo` ([240f4a0](https://github.com/azzamsa/roof/commit/240f4a0eff2b9b80c145069ac150e28071528a79))
- Some linters assume that every configuration uses the default location ([51a6425](https://github.com/azzamsa/roof/commit/51a6425e832eb27ffd1dc54a07fddf66200abbc9))
- Place formatter and linter configs in the root directory ([3cdb101](https://github.com/azzamsa/roof/commit/3cdb101ab73597a72fac08e4180b227e9193e1da))

  Otherwise, we would have to deal with a custom `--config-path` for every possible formatter on Earth.
  It's okay to let them clutter the directory (check out the Neovim repo).
  Even if they are visible on the GitHub repo, locally they are hidden by your favorite editor.

- Remove lualine copilot config ([84be5eb](https://github.com/azzamsa/roof/commit/84be5eba34003dbda0b843e175482cee49583bfa))

  I don't use copilot.

- Ignore files inside `.git` in `Telescope find_files` ([33b1180](https://github.com/azzamsa/roof/commit/33b1180c7ff31709346211ec80e4f12048743eba))
- `surround` doesn't work in Neogit rebase editor ([b40c6c8](https://github.com/azzamsa/roof/commit/b40c6c88ba45fbd37caf008583929c4c2432063a))

  I need to override Neogit mappings.
  At the same time, it is also a chance to use Colemak keys.

- Neogit doesn't use the current path in non-VCS directories ([1a96a1c](https://github.com/azzamsa/roof/commit/1a96a1c675700cefd6ff7dd3f59e4bb28270b5fc))

  This issue fixes the ability to initialize empty directory.
  Otherwise, I have to open a Terminal and run `git init`.

- Don't run formatter when the config is not exists ([b77bf28](https://github.com/azzamsa/roof/commit/b77bf28648a5b1af40036c8bdee6c07726cf8a93))
- `C-w p` don't work well with Telescope ([2f5f6bb](https://github.com/azzamsa/roof/commit/2f5f6bb9b4447aa9bf48d65a5fa3b873d6261543))

  `C-W p` doesn't work if the next buffer is opened via `Telescope`.
  However, it works when opened from `oil.nvim` or `:e .`.
  I am not the only one experiencing this issue; others have resorted to using `C-w hjkl`.
  But my Doom Emacs muscle memory is so strong that I don't want to abandon it.
  Thus, the wizards of the Neovim core team come to my rescue with this `expr` hackery.
  Thank you, Sean Dewar (seandewar).

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
