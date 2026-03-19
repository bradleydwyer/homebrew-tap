class Sloppy < Formula
  desc "Fast regex-based detection of AI prose tells"
  homepage "https://github.com/bradleydwyer/sloppy"
  version "1.0.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/sloppy/releases/download/v1.0.2/sloppy-aarch64-apple-darwin"
      sha256 "26abf4436e8aae758edfbfbbc0a16e01990b1c2b0e94769c64d9a87ff60758dd"
    else
      url "https://github.com/bradleydwyer/sloppy/releases/download/v1.0.2/sloppy-x86_64-apple-darwin"
      sha256 "35ad8df0fdefd1e712495a954ee7826a43c319c7fb49b91922845120dd0b1d5d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/sloppy/releases/download/v1.0.2/sloppy-aarch64-unknown-linux-gnu"
      sha256 "f5fd9a9143e052471453d05166342839cff6f2a84f6c491f636c0625d800da66"
    else
      url "https://github.com/bradleydwyer/sloppy/releases/download/v1.0.2/sloppy-x86_64-unknown-linux-gnu"
      sha256 "2f577caaedf4efc49f90612bcb3537031e2ae5ed4eeb36ba7ce46077ee6fa788"
    end
  end

  def install
    bin.install Dir["sloppy*"].first => "sloppy"
  end

  test do
    assert_match "sloppy", shell_output("\#{bin}/sloppy --version")
  end
end
