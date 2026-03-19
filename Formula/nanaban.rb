class Nanaban < Formula
  desc "Gemini image generation CLI (Nano Banana 2 / Pro)"
  homepage "https://github.com/bradleydwyer/nanaban"
  version "0.2.7"
  license "MIT"

  on_macos do
    url "https://github.com/bradleydwyer/nanaban/releases/download/v0.2.7/nanaban-aarch64-apple-darwin"
    sha256 "4f5af65665561ad4b7ded7472a18bf9013b4d04ca4fea2976589f8401ce13d89"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/nanaban/releases/download/v0.2.7/nanaban-aarch64-unknown-linux-gnu"
      sha256 "0165f8297388b45391192aa5167859940e77978791f51df4221b2d1995c1de28"
    else
      url "https://github.com/bradleydwyer/nanaban/releases/download/v0.2.7/nanaban-x86_64-unknown-linux-gnu"
      sha256 "0f1a82e8c051f0dd16dcb2789ae6fe689fa6982871d2344099d7a55f7ca98ceb"
    end
  end

  def install
    bin.install Dir["nanaban*"].first => "nanaban"
  end

  test do
    assert_match "nanaban", shell_output("\#{bin}/nanaban --version")
  end
end
