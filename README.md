# Neovim Nightly Homebrew Tap

This Homebrew tap provides a formula for installing and updating Neovim nightly builds directly from the official GitHub releases.

## Installation

```bash
# Add this tap to your Homebrew
brew tap yourusername/neovim-nightly

# Install Neovim nightly
brew install neovim-nightly
```

## Usage

After installation, you can use Neovim by running:

```bash
nvim
```

## Updating

To update to the latest nightly build:

```bash
brew update
brew upgrade neovim-nightly
```

## About This Tap

This tap automatically downloads the appropriate Neovim nightly build for your system architecture (ARM64 or x86_64) and operating system (macOS or Linux).

### Features

- Automatically selects the correct build for your system
- Easy installation and updates through Homebrew
- Tracks the latest nightly builds from the official Neovim releases

## Conflicts with Stable Neovim

This formula conflicts with the stable Neovim formula (`neovim`). If you have both installed, the last one linked will be used when you run `nvim`.

To switch between versions:

```bash
# Use nightly version
brew link neovim-nightly

# Use stable version
brew unlink neovim-nightly
```

## License

This Homebrew tap is provided under the MIT License. Neovim itself is licensed under the Apache 2.0 license.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.
