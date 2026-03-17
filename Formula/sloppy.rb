class Sloppy < Formula
  desc "Fast regex-based detection of AI prose tells. No LLM calls, no heavy NLP."
  homepage "https://github.com/bradleydwyer/sloppy"
  url "https://github.com/bradleydwyer/sloppy/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "379d34bc6cf4e8902cab0a5755c016435340a2fe26c09d1e65bc23017ae508ec"
  license "MIT"

  bottle do
    root_url "https://github.com/bradleydwyer/sloppy/releases/download/v1.0.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "46f9978c7299b527ed4f040a431b25e1d39e7127672b6d02d0e0c65c392ff97d"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "95acd67286b50077e9b72b78332ac6e7e6398526f60d7ea7ad57519c6693676d"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "d9fc16e2e5fd4b8e798311c047c677f07825c899027cc278d45e0dfc3a7ceda6"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    assert_match "sloppy", shell_output("#{bin}/sloppy --version")
  end
end
