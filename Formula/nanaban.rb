class Nanaban < Formula
  desc "Gemini image generation CLI (Nano Banana 2 / Pro)"
  homepage "https://github.com/bradleydwyer/nanaban"
  url "https://github.com/bradleydwyer/nanaban/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "b50910fb5be9745a526279becf7ecc16a1c7e21538ed7564e6f0cc4f114694de"
  license "MIT"

  bottle do
    root_url "https://github.com/bradleydwyer/nanaban/releases/download/v0.2.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "d9d44e2f9e4766a8bc93d60e0336fa4aef560facb8be871aad963a5f458993b6"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "dfc068952710cef43218d0b817ecd6bf369eb4e27eaf29fe5514175172a7bc75"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "d4416586e9c6f7c8c02227370ac3d5b7491a7c2895f2bf0d8f6c0b59258cf244"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    assert_match "nanaban", shell_output("#{bin}/nanaban --version")
  end
end
