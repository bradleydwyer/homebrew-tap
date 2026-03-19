class Parked < Formula
  desc "Tiered domain availability checker (DNS, WHOIS, RDAP) with CLI and MCP server"
  homepage "https://github.com/bradleydwyer/parked"
  version "2.2.5"
  license "MIT"

  on_macos do
    url "https://github.com/bradleydwyer/parked/releases/download/v2.2.5/parked-aarch64-apple-darwin"
    sha256 "ec0c11cdb6dd2287480ed54ea6a6342655134ab2db874c0fd9166f74600f8bcf"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/parked/releases/download/v2.2.5/parked-aarch64-unknown-linux-gnu"
      sha256 "a20d01c079300c4500dfec6d0e8e0087183cbdee9df776582ae5bd1a43ea3ea5"
    else
      url "https://github.com/bradleydwyer/parked/releases/download/v2.2.5/parked-x86_64-unknown-linux-gnu"
      sha256 "c09f7be03f9b168ff4e970226b17bafe0fd101d4790af12b5e1741ad11f7584e"
    end
  end

  def install
    bin.install Dir["parked*"].first => "parked"
  end

  test do
    assert_match "parked", shell_output("\#{bin}/parked --version")
  end
end
