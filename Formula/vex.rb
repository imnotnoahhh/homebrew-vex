class Vex < Formula
  desc "A fast, multi-language version manager for macOS"
  homepage "https://github.com/imnotnoahhh/vex"
  version "1.5.0"
  license "MIT"

  on_arm do
    url "https://github.com/imnotnoahhh/vex/releases/download/v1.5.0/vex-aarch64-apple-darwin.tar.gz"
    sha256 "0c8355f1564d2fb904004760ff3e67865a5a1e217129761c61eba5c814d149e2"
  end

  on_intel do
    url "https://github.com/imnotnoahhh/vex/releases/download/v1.5.0/vex-x86_64-apple-darwin.tar.gz"
    sha256 "60ab29db92665999951acd5afd5c1f998afa78900b9923a3653e39763129d372"
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
