class SolcastProxy < Formula
  desc "Caching reverse proxy for the Solcast solar forecast API"
  homepage "https://github.com/bradleydwyer/solcast-proxy"
  url "https://github.com/bradleydwyer/solcast-proxy/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "da9d5d2f3ad36dfd5380e9502db6563c26aa08bfc05fa5a0d0ec15e0cdc6f52f"
  license "MIT"

  bottle do
    root_url "https://github.com/bradleydwyer/solcast-proxy/releases/download/v1.0.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "5df53eec4792844f41b7eac2e98dac904aa5b8832795666b9d229fbe92760457"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "146ac147f71eb57102117ae4e21c77a87b5729d35f85377f4c96f4288c680ba7"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "7f562d5b25947bcab19f0da323f077a0da7b3c8e84dd10d2519925bfc3c0da32"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    assert_match "solcast-proxy", shell_output("#{bin}/solcast-proxy --version")
  end
end
