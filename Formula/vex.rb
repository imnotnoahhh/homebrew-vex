class Vex < Formula
  desc "A fast, multi-language version manager for macOS"
  homepage "https://github.com/imnotnoahhh/vex"
  version "1.6.0"
  license "MIT"

  on_arm do
    url "https://github.com/imnotnoahhh/vex/releases/download/v1.6.0/vex-aarch64-apple-darwin.tar.gz"
    sha256 "a2982d63f2ea38a521e2a069f1d725ad2f94ea37c4ac59eed4d6d6a3bf1be287"
  end

  on_intel do
    url "https://github.com/imnotnoahhh/vex/releases/download/v1.6.0/vex-x86_64-apple-darwin.tar.gz"
    sha256 "05d90e7f034ceb14def84bd567c6f4bead5f078261465085a62e71532a3eb2ea"
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
