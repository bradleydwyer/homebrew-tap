class Available < Formula
  desc "AI-powered project name finder with domain and package registry checks"
  homepage "https://github.com/bradleydwyer/available"
  url "https://github.com/bradleydwyer/available/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "c36e4d0709391f0bfac7221809316c2276ab187cdbee8c28bee12539fdf83216"
  license "MIT"

  bottle do
    root_url "https://github.com/bradleydwyer/available/releases/download/v1.0.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "c7f2a9b027ccbc92f15daae87ff076e26486c5bacf04ec149ce73de299c87e29"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "3c081b5519bf9783e740dd83ae15b438ba822e460902f0b326bece0e46d421fa"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "1bb81e00ffacf2def3560ff5d379c634523175bec8d5c1bdeb031020ab1c1bdc"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    assert_match "available", shell_output("#{bin}/available --version")
  end
end
