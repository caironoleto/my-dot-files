This is my dot files. I've using this dot-files since I don't know :P

### Setup (if you're is setuping a new env)

* [Install oh my zsh](https://ohmyz.sh/);
* [Install asdf](https://asdf-vm.com/#/core-manage-asdf-vm?id=install-asdf-vm);
* [Install Fira Coda](https://github.com/tonsky/FiraCode/wiki);
* [Install Powerline fonts](https://github.com/powerline/fonts);
* [Install Vundle](https://github.com/VundleVim/Vundle.vim#quick-start).

## If you're using Mac

Setup tmux keys in iTerm2, open preferences:

* Prefix key: In Profiles (this override the iTerm2 default shortcut) -> Keys add a new key to `⌘ + a`, to send the hex code `0x02`;
* Previous window: In Keys (this does not override defaults shortcuts) -> Key Binding add a new key to `⌘ + shift + [`, to send the hex code `0x02 0x70`;
* Next window: In Keys -> Key Bindings add a new key to `⌘ + shift + ]`, to send the hex code `0x02 0x6E`;
* `⌥` + ←` to navigate among words: In Profiles, change the `⌥` + ←` to send an Escape sequence with the key `b`;
* `⌥` + →` to navigate among words: In Profiles, change the `⌥` + →` to send an Escape sequence with the key `f`.

### Installation

Now, install my aewsome dot files!

```shell
git clone https://gitlab.com/caironoleto/my-dot-files.git ~/.my-dot-files
cd ~/.my-dot-files
ruby install.rb
```

### Uninstalling

Just do

```shell
cd ~/.my-dot-files
ruby uninstall.rb
cd ~
rm -rf ~/.my-dot-files
```

## Contributing

If you want contribute, please:

* Fork the project;
* Make your feature addition or bug fix or whatever you want;
* Send me a Pull or Merge request.
