class Sloppy < Formula
  desc "Fast regex-based detection of AI prose tells. No LLM calls, no heavy NLP."
  homepage "https://github.com/bradleydwyer/sloppy"
  url "https://github.com/bradleydwyer/sloppy/archive/refs/tags/v0.7.0.tar.gz"
  sha256 "79dac1884b2b90b6ac7dfa9f41bf66959848364e8fce32d3df690c21ac091a43"
  license "MIT"

  bottle do
    root_url "https://github.com/bradleydwyer/sloppy/releases/download/v0.7.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "a158e1412f1ba8b32011933b7ffb003e4ac9371ba0a6325db4aa0961dad1dbd3"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "575658f81614e4608137c0b3c66eb6e7a43b3b61217b0c3f7b114f50c0c56ec9"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "b6ba06172b89775f2e289575164ad517ac831493d9e4444f57c602de53ec18c7"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    assert_match "sloppy", shell_output("#{bin}/sloppy --version")
  end
end
