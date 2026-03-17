class Available < Formula
  desc "AI-powered project name finder with domain and package registry checks"
  homepage "https://github.com/bradleydwyer/available"
  url "https://github.com/bradleydwyer/available/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "d7c534aca61e0ad2540c8d36d6adbba36435fc2ae8a34cf84b725f2735694ea9"
  license "MIT"

  bottle do
    root_url "https://github.com/bradleydwyer/available/releases/download/v1.0.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "693bf70e855c2b5833c0461bfe75c626bb0e90d91685b21de31b825779aad5cc"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "94042e910e714c85a161bc82f6cc776afc020019a24300ab7dbe802409a2e0d0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "4333b6020356fc7407bab085d657531ee29f41702c9637b1fe1d2ec9ef2cfd65"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    assert_match "available", shell_output("#{bin}/available --version")
  end
end
