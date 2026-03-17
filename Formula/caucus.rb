class Caucus < Formula
  desc "Multi-LLM consensus engine — aggregate and synthesize LLM outputs"
  homepage "https://github.com/bradleydwyer/caucus"
  url "https://github.com/bradleydwyer/caucus/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "8a13427e7948191fd861157f02151bc4208f3efaf9732856742c2c9e56fafcbc"
  license "MIT"

  bottle do
    root_url "https://github.com/bradleydwyer/caucus/releases/download/v1.0.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "9bcc57f9de4ce8a3b57020420e3b866a70cb371d05963bbaa9c49868c338c0cb"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "88e759f51993a2460cd94da0e64db5b3c4588a0599b915417523bbbe599f398d"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "22df102b8b45c106067109dabe40a54c2021a135aef485a4b7835b098b7ee803"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "crates/caucus-cli"
  end

  test do
    assert_match "caucus", shell_output("#{bin}/caucus --version")
  end
end
