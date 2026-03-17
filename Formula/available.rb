class Available < Formula
  desc "AI-powered project name finder with domain and package registry checks"
  homepage "https://github.com/bradleydwyer/available"
  url "https://github.com/bradleydwyer/available/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "8e0d85ec91177295a0e5c228f7fc13f305306e330e7f21e1fa822500c740c7fd"
  license "MIT"

  bottle do
    root_url "https://github.com/bradleydwyer/available/releases/download/v0.1.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "af38fbc264b24f547ccbf9ab3222aac6476fe23ec61046192a1328c0e790e30e"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "f99c493f0b58a7132322c6343eb3512c0acf10755ff249347657aed38f1b2095"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "183f247625699636177dd2f01c6a20cf54c4f0f0b4be64bf3acc6bdb729b3200"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    assert_match "available", shell_output("#{bin}/available --version")
  end
end
