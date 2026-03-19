class Nanaban < Formula
  desc "Gemini image generation CLI (Nano Banana 2 / Pro)"
  homepage "https://github.com/bradleydwyer/nanaban"
  url "https://github.com/bradleydwyer/nanaban/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "636a78ebfaa9a32d54637a6071b7437578c644d612414df2832d935ebbae7002"
  license "MIT"

  bottle do
    root_url "https://github.com/bradleydwyer/nanaban/releases/download/v0.2.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "209ce20ecd154ecc5b7c0763188d0dd22bcb873a15f7e67cde34be8fced05fa6"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "0eef63f23e2594dc7f47fa7b5494f0960fe1e713ddf8a8aa7d935374cf94c0b7"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "62f179de27240b15ef10edd5a429a436af0a4d002d3b867a42d7442691495ad3"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    assert_match "nanaban", shell_output("#{bin}/nanaban --version")
  end
end
