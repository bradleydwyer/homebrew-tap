class Thunk < Formula
  desc "Capture ideas quickly, optionally research them with Claude"
  homepage "https://github.com/bradleydwyer/thunk"
  version "0.1.0"
  license "MIT"

  on_macos do
    url "https://github.com/bradleydwyer/thunk/releases/download/v0.1.0/thunk-aarch64-apple-darwin"
    sha256 "f7b379c4db2553b92620d57c3c191cc6bea20445efaca340b73eac853c75bfd1"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/thunk/releases/download/v0.1.0/thunk-aarch64-unknown-linux-gnu"
      sha256 "2f3cce59794ffc421b148da03f64dba056d71e2df2129cb699d01df8bafe3c1b"
    else
      url "https://github.com/bradleydwyer/thunk/releases/download/v0.1.0/thunk-x86_64-unknown-linux-gnu"
      sha256 "ee9b6cff956ecf2b54c1903dc4e75ca6eb097dee7fcf3fcc0ce883349533cb6e"
    end
  end

  def install
    bin.install Dir["thunk*"].first => "thunk"
  end

  test do
    assert_match "thunk", shell_output("\#{bin}/thunk --version")
  end
end
