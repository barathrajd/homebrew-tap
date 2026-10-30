# Rendered by scripts/render-homebrew-formula.sh for each release and pushed
# to github.com/barathrajd/homebrew-tap. Edit this template, not the tap.
class Gitview < Formula
  desc "Keyboard-first terminal interface for reviewing Git history and changes"
  homepage "https://github.com/barathrajd/gitview"

  # The macOS archive is the default, so Homebrew can load the formula on
  # every machine; the arch dependencies then refuse anything but Apple
  # Silicon and x86_64 Linux before downloading.
  url "https://github.com/barathrajd/gitview/releases/download/v0.7.0/gitview-v0.7.0-macos-arm64.tar.gz"
  sha256 "d55d1fd07daadb40ad8c0a925fee4cce9ba6d1d549353772348cba04c62737be"
  license "MIT"

  depends_on "git"

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/barathrajd/gitview/releases/download/v0.7.0/gitview-v0.7.0-linux-x86_64.tar.gz"
      sha256 "647fb3c5455c455d8fb9885e9ee06877fe07f4d983f3616a86a4257f00aea1f7"
    end
  end

  def install
    bin.install "gitview"
  end

  test do
    assert_match "gitview #{version}", shell_output("#{bin}/gitview --version")
  end
end
