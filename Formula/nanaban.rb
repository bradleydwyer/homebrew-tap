class Nanaban < Formula
  desc "Gemini image generation CLI (Nano Banana 2 / Pro)"
  homepage "https://github.com/bradleydwyer/nanaban"
  version "0.2.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/nanaban/releases/download/v0.2.3/nanaban-aarch64-apple-darwin"
      sha256 "e8abee0ae43c57fef15952eb76d0c03297c90557b11d3b790eae08b4fc1fcc7f"
    else
      url "https://github.com/bradleydwyer/nanaban/releases/download/v0.2.3/nanaban-x86_64-apple-darwin"
      sha256 "eece54138864572d5c6f7332cf2bb28f97497af16a3364bf21c3a12f63f880ce"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/nanaban/releases/download/v0.2.3/nanaban-aarch64-unknown-linux-gnu"
      sha256 "e7b90e177cde80b732aa7b51314ca72c49409cd2fdd2bf9ca8ac9be554f25eff"
    else
      url "https://github.com/bradleydwyer/nanaban/releases/download/v0.2.3/nanaban-x86_64-unknown-linux-gnu"
      sha256 "2136c47bf0c0845f178df6404645ccb65562ac743562d75d5b836ed13768032b"
    end
  end

  def install
    bin.install Dir["nanaban*"].first => "nanaban"
  end

  test do
    assert_match "nanaban", shell_output("\#{bin}/nanaban --version")
  end
end
