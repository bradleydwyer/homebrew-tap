class Parked < Formula
  desc "Tiered domain availability checker (DNS, WHOIS, RDAP) with CLI and MCP server"
  homepage "https://github.com/bradleydwyer/parked"
  version "2.2.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/parked/releases/download/v2.2.3/parked-aarch64-apple-darwin"
      sha256 "02b7125ffe83d9ae1edb02f572b30c37aea42e24a73c90e0794ec2aa61f51f10"
    else
      url "https://github.com/bradleydwyer/parked/releases/download/v2.2.3/parked-x86_64-apple-darwin"
      sha256 "9874587491143ad93966f3481a603cf24de205c9fb0c40f4876c78fb8def91a5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/parked/releases/download/v2.2.3/parked-aarch64-unknown-linux-gnu"
      sha256 "decdc3bcbc6d2ad274896c1dc998aef17934eecb18f68fd22d6cbd771e8f6ef7"
    else
      url "https://github.com/bradleydwyer/parked/releases/download/v2.2.3/parked-x86_64-unknown-linux-gnu"
      sha256 "95d70c171783f33767109c5d671078be5ea046ffda557fcf3f8d060aca69882d"
    end
  end

  def install
    bin.install Dir["parked*"].first => "parked"
  end

  test do
    assert_match "parked", shell_output("\#{bin}/parked --version")
  end
end
