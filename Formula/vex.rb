class Vex < Formula
  desc "A fast, multi-language version manager for macOS"
  homepage "https://github.com/imnotnoahhh/vex"
  version "1.4.0"
  license "MIT"

  on_arm do
    url "https://github.com/imnotnoahhh/vex/releases/download/v1.4.0/vex-aarch64-apple-darwin.tar.gz"
    sha256 "20725370d2fa4454d00e9f69157307747daa8d7ceea1fc13e690fad26fc80c47"
  end

  on_intel do
    url "https://github.com/imnotnoahhh/vex/releases/download/v1.4.0/vex-x86_64-apple-darwin.tar.gz"
    sha256 "246c301da5e1c639211edbb00f17d0aa133b87c37a788f82585e6cc900adf71d"
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
