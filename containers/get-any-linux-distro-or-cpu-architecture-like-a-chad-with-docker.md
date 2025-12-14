To install Docker Desktop on macOS, run this command.

```bash
brew install --cask docker
```

Log in, make an account, and make sure your account is verified, as we’ll download a Linux image from Docker..

Now, go to the Terminal, and do this, in order to create and run the container.

```bash
docker run --platform linux/arm64 -it --name thighhighs ubuntu bash
```

If you want to start it again later, you do this.

```bash
docker start thighhighs
```

Then, to attach to its shell, run this.

```bash
docker exec -it thighhighs bash
```

Now that we have a shell, we’ll need to install a few things. By the way, logged in as root, so no need for sudo.

```bash
apt update && apt upgrade
```

If you do `apt install neovim`, you’ll end up with an older version. If you want the more current, `unstable` one, run this.

```
apt install -y software-properties-common
add-apt-repository ppa:neovim-ppa/unstable -y
apt update && apt upgrade
apt install neovim
```

To continue, you’ll need to install git as well, although curl and wget can be rather useful too.

```
apt install git curl wget
```

The first thing we’re going to do is copy my Neovim config over to the container. Do this in a different Terminal window, outside of the container.

First, you can get your contained ID by doing this.

```bash
docker ps
```

Then, you can use Docker to copy stuff into the container itself.

```bash
docker cp ~/.config/nvim <container_name_or_id>:/root/.config/nvim
```

Alternatively, you can install a Neovim distro, like LazyVim, for example.

```bash
git clone https://github.com/LazyVim/starter ~/.config/nvim
```

You should also install `ripgrep`, as the Telescope plugin uses it.

```bash
apt install ripgrep
```
