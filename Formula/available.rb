class Available < Formula
  desc "AI-powered project name finder with domain and package registry checks"
  homepage "https://github.com/bradleydwyer/available"
  url "https://github.com/bradleydwyer/available/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "09ddd5b324b517c5d8cfda5d5d173bb04e541434ff4c12cd3d1d97a24fce05a2"
  license "MIT"

  bottle do
    root_url "https://github.com/bradleydwyer/available/releases/download/v1.1.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "c2b5cc4cfb0bd5608ddeae80282e9bbfc1e58e4bc6bb49a7efa83204c2387fd2"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "b86ec445f05930b41095197c3609ff4a0edfed6ef0461d89cb5ef0a92c088cbe"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "377cf9ea93bac6d0739fbfbc0d3293aeda40a65d42bfbbf62aa4319f8f135a3f"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    assert_match "available", shell_output("#{bin}/available --version")
  end
end
