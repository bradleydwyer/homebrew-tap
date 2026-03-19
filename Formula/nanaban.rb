class Nanaban < Formula
  desc "Gemini image generation CLI (Nano Banana 2 / Pro)"
  homepage "https://github.com/bradleydwyer/nanaban"
  version "0.2.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/nanaban/releases/download/v0.2.4/nanaban-aarch64-apple-darwin"
      sha256 "87ddf00e189ad058e586731eac990b5c0bba126a36e2714b2aa5c1fd3807f657"
    else
      url "https://github.com/bradleydwyer/nanaban/releases/download/v0.2.4/nanaban-x86_64-apple-darwin"
      sha256 "91656fcc96c9316712570782f351526d450447972cd840856fc8aae1c4bb4406"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/nanaban/releases/download/v0.2.4/nanaban-aarch64-unknown-linux-gnu"
      sha256 "478af2388f1b67aff11d451b8b17a79679ed800e2d794f05843977a55ea7c6de"
    else
      url "https://github.com/bradleydwyer/nanaban/releases/download/v0.2.4/nanaban-x86_64-unknown-linux-gnu"
      sha256 "61b889eea65cda66fd182e6733a0f8d8a79180efcfe2cbf819b75b8d8e0dbe02"
    end
  end

  def install
    bin.install Dir["nanaban*"].first => "nanaban"
  end

  test do
    assert_match "nanaban", shell_output("\#{bin}/nanaban --version")
  end
end
