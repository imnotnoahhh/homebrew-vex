class Vex < Formula
  desc "A fast, multi-language version manager for macOS"
  homepage "https://github.com/imnotnoahhh/vex"
  version "1.3.0"
  license "MIT"

  on_arm do
    url "https://github.com/imnotnoahhh/vex/releases/download/v1.3.0/vex-aarch64-apple-darwin.tar.gz"
    sha256 "cb6c9603c1dd10fe4b6b075f270fa09deaac772d6939fe7fc435705abe3eafa3"
  end

  on_intel do
    url "https://github.com/imnotnoahhh/vex/releases/download/v1.3.0/vex-x86_64-apple-darwin.tar.gz"
    sha256 "9d6f593662728d55cf6a8b4c7ca6debe5d6a573f3b955881b94573d923c614a2"
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
