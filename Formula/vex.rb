class Vex < Formula
  desc "A fast, multi-language version manager for macOS"
  homepage "https://github.com/imnotnoahhh/vex"
  version "1.2.0"
  license "MIT"

  on_arm do
    url "https://github.com/imnotnoahhh/vex/releases/download/v1.2.0/vex-aarch64-apple-darwin.tar.gz"
    sha256 "fa5133a3c7fe114ab7168dc2bf899934e2c2f8f11f53ace99a6a91c56ab0a5dc"
  end

  on_intel do
    url "https://github.com/imnotnoahhh/vex/releases/download/v1.2.0/vex-x86_64-apple-darwin.tar.gz"
    sha256 "a3481f374299ed0f197b1dab24cb13f8d696c1fc9d6273dec72ee79662116b80"
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
