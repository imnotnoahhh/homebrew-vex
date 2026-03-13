class Vex < Formula
  desc "A fast, multi-language version manager for macOS"
  homepage "https://github.com/imnotnoahhh/vex"
  version "1.1.1"
  license "MIT"

  on_arm do
    url "https://github.com/imnotnoahhh/vex/releases/download/v1.1.1/vex-aarch64-apple-darwin.tar.gz"
    sha256 "b15e4e6e3325c3b427db99a2c42976157fa30155d6c30609d67d5c0b780c25c4"
  end

  on_intel do
    url "https://github.com/imnotnoahhh/vex/releases/download/v1.1.1/vex-x86_64-apple-darwin.tar.gz"
    sha256 "e1c7af3fecdd6e4bf69c7cfdd718937ae306ac9ba029a681be03cdf90d22a5c7"
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
