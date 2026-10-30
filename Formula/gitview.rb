# Rendered by scripts/render-homebrew-formula.sh for each release and pushed
# to github.com/barathrajd/homebrew-tap. Edit this template, not the tap.
class Gitview < Formula
  desc "Keyboard-first terminal interface for reviewing Git history and changes"
  homepage "https://github.com/barathrajd/gitview"

  # The macOS archive is the default, so Homebrew can load the formula on
  # every machine; the arch dependencies then refuse anything but Apple
  # Silicon and x86_64 Linux before downloading.
  url "https://github.com/barathrajd/gitview/releases/download/v0.7.1/gitview-v0.7.1-macos-arm64.tar.gz"
  sha256 "0594f31e2eaad40610f0d52c45215eee5939ec08144ccc2f27b7f2b1f8c6950e"
  license "MIT"

  depends_on "git"

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/barathrajd/gitview/releases/download/v0.7.1/gitview-v0.7.1-linux-x86_64.tar.gz"
      sha256 "8a2b5a18ae2e973cfc8bf2e37dd1c28e2a0740f4c83d822e58dca0c2c8b81711"
    end
  end

  def install
    bin.install "gitview"
  end

  test do
    assert_match "gitview #{version}", shell_output("#{bin}/gitview --version")
  end
end
