class Parked < Formula
  desc "Tiered domain availability checker (DNS, WHOIS, RDAP) with CLI and MCP server"
  homepage "https://github.com/bradleydwyer/parked"
  version "2.2.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/parked/releases/download/v2.2.2/parked-aarch64-apple-darwin"
      sha256 "5265766ceba358fe4d30a03b93b2d9cc40bd0330be6568a7cab083a82309f5d7"
    else
      url "https://github.com/bradleydwyer/parked/releases/download/v2.2.2/parked-x86_64-apple-darwin"
      sha256 "b3d234999968844fa92de23d7c048c4f03002e8934604475ba237b013eb302e5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/parked/releases/download/v2.2.2/parked-aarch64-unknown-linux-gnu"
      sha256 "40cf2e614c5a81af4cc7d941894d8f4544e20d4090c5d5998b62a4690b9544e1"
    else
      url "https://github.com/bradleydwyer/parked/releases/download/v2.2.2/parked-x86_64-unknown-linux-gnu"
      sha256 "43a307d984ddd3841e847ce8bd9299c2361ebfbdd17a605582e1ec2a8f13dd13"
    end
  end

  def install
    bin.install Dir["parked*"].first => "parked"
  end

  test do
    assert_match "parked", shell_output("\#{bin}/parked --version")
  end
end
