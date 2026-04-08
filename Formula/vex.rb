class Vex < Formula
  desc "A fast, multi-language version manager for macOS"
  homepage "https://github.com/imnotnoahhh/vex"
  version "1.6.1"
  license "MIT"

  on_arm do
    url "https://github.com/imnotnoahhh/vex/releases/download/v1.6.1/vex-aarch64-apple-darwin.tar.gz"
    sha256 "3bc15c0f2b47b94e5e4378a07452057853c0a6fa4afe69b9fbf5e08d141550ac"
  end

  on_intel do
    url "https://github.com/imnotnoahhh/vex/releases/download/v1.6.1/vex-x86_64-apple-darwin.tar.gz"
    sha256 "935d62a7bb9286e7f70d50b7fb1fac657af7bb07feeb0d32bc76c1dcf3dda89d"
  end

  def install
    bin.install "vex"
  end

  def caveats
    <<~EOS
      Homebrew installs the vex binary, but does not modify your shell configuration.

      Preview the initialization steps:
        vex init --dry-run

      Configure zsh integration:
        vex init --shell zsh

      Or print shell hooks manually:
        vex env zsh
    EOS
  end

  test do
    assert_match "vex #{version}", shell_output("#{bin}/vex --version")
    assert_match "Would create", shell_output("#{bin}/vex init --dry-run")
  end
end
