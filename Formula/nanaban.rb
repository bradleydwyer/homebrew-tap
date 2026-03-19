class Nanaban < Formula
  desc "Gemini image generation CLI (Nano Banana 2 / Pro)"
  homepage "https://github.com/bradleydwyer/nanaban"
  version "0.2.5"
  license "MIT"

  on_macos do
    url "https://github.com/bradleydwyer/nanaban/releases/download/v0.2.5/nanaban-aarch64-apple-darwin"
    sha256 "9304e3d24d7b64f466ab40885d70decaa961e1eb7af4394895b427906c54f2d0"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/nanaban/releases/download/v0.2.5/nanaban-aarch64-unknown-linux-gnu"
      sha256 "722a17f0469c6867743040677a6e7a0ae9d310aa7ac3ca43e88e01a21b6b24dd"
    else
      url "https://github.com/bradleydwyer/nanaban/releases/download/v0.2.5/nanaban-x86_64-unknown-linux-gnu"
      sha256 "f5a079f0495e076a53312e2fcb88489215e6e43d1ec2b280a7918c371c5c2cf8"
    end
  end

  def install
    bin.install Dir["nanaban*"].first => "nanaban"
  end

  test do
    assert_match "nanaban", shell_output("\#{bin}/nanaban --version")
  end
end
