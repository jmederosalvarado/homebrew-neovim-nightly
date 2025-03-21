class NeovimNightly < Formula
  desc "Vim-fork focused on extensibility and usability (nightly build)"
  homepage "https://neovim.io"
  version "nightly"
  license "Apache-2.0"

  livecheck do
    skip "No version information available for nightly builds"
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz"
    else
      url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-x86_64.tar.gz"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/neovim/neovim/releases/download/nightly/nvim-linux-arm64.tar.gz"
    else
      url "https://github.com/neovim/neovim/releases/download/nightly/nvim-linux-x86_64.tar.gz"
    end
  end

  # We don't need to verify checksum for nightly builds
  sha256 ""

  conflicts_with "neovim", because: "ships the same binaries"

  def install
    # The contents of the archive are inside a top-level directory with the same name
    # as the archive. We need to move all the contents to the prefix directory.
    libexec.install Dir["*"]
    bin.install_symlink Dir["#{libexec}/bin/*"]
    man1.install_symlink Dir["#{libexec}/share/man/man1/*"] if Dir.exist?("#{libexec}/share/man/man1")
  end

  def caveats
    <<~EOS
      This is the nightly version of Neovim.
      If you also have the stable version of Neovim installed, this will override it.
      To use the stable version, unlink this version:
        brew unlink neovim-nightly
    EOS
  end

  test do
    system bin/"nvim", "--version"
  end
end
