class Vex < Formula
  desc "A fast, multi-language version manager for macOS"
  homepage "https://github.com/imnotnoahhh/vex"
  version "1.7.0"
  license "MIT"

  on_arm do
    url "https://github.com/imnotnoahhh/vex/releases/download/v1.7.0/vex-aarch64-apple-darwin.tar.gz"
    sha256 "76babf0fbf60412e29359338fe4789af882ee1382ad6fe02241041dfba57e793"
  end

  on_intel do
    url "https://github.com/imnotnoahhh/vex/releases/download/v1.7.0/vex-x86_64-apple-darwin.tar.gz"
    sha256 "b2bbece1df8834e7612bf083d79318424e36bde595f2885a54ebb01022d035ae"
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
