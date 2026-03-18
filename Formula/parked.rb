class Parked < Formula
  desc "Tiered domain availability checker (DNS, WHOIS, RDAP) with CLI and MCP server"
  homepage "https://github.com/bradleydwyer/parked"
  url "https://github.com/bradleydwyer/parked/archive/refs/tags/v2.1.0.tar.gz"
  sha256 "47836c796b7ec4717b5cf86613fa394d869b3fefd55899ed9b0bb845fc737a35"
  license "MIT"

  bottle do
    root_url "https://github.com/bradleydwyer/parked/releases/download/v2.1.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "5667c02e5d4971d743177b6e4c4db5123339d44537769fc4998a60affa304114"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "b158d0dc096f00a744912eb6541ddbfbb473fe1ff89837fdc1b611f780a151dd"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "09c53b8949122e01f5536b258b04e0186c171c7dd9985244fb13a70844bbdc24"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    assert_match "parked", shell_output("#{bin}/parked --version")
  end
end
