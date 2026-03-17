class Nanaban < Formula
  desc "Gemini image generation CLI (Nano Banana 2 / Pro)"
  homepage "https://github.com/bradleydwyer/nanaban"
  url "https://github.com/bradleydwyer/nanaban/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "da7b23e56f4baac92041ca192d895f7c2bb74e5fc829bc494ead2478d1ef8d0b"
  license "MIT"

  bottle do
    root_url "https://github.com/bradleydwyer/nanaban/releases/download/v0.1.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "77fa10e784d34848574ba05258e2e313d5111ad82e347b4005245855bb25b435"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "fc9955bc78b4af12466819f9685c769ce4ee02b2c112b219e8203fb00813c739"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "29f417b63f4cfd1026c6d4c185688230ec9b61c3fc692f6edf4e5c27e2722ad1"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    assert_match "nanaban", shell_output("#{bin}/nanaban --version")
  end
end
