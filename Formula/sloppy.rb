class Sloppy < Formula
  desc "Fast regex-based detection of AI prose tells"
  homepage "https://github.com/bradleydwyer/sloppy"
  version "1.0.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/sloppy/releases/download/v1.0.1/sloppy-aarch64-apple-darwin"
      sha256 "dcb59260f664cf02391e837e9e7e463ef7828e8bbb5f9bea204535fa20d3533a"
    else
      url "https://github.com/bradleydwyer/sloppy/releases/download/v1.0.1/sloppy-x86_64-apple-darwin"
      sha256 "974ef96a2ca95d9ff722ab67fb28ea0d1c0bc8fd9d773cc0ed9a6137979c10bb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/sloppy/releases/download/v1.0.1/sloppy-aarch64-unknown-linux-gnu"
      sha256 "00b7653981d51eaf08186cf05db03b8ef16c64063fb50ba4768dedb1853ac1c0"
    else
      url "https://github.com/bradleydwyer/sloppy/releases/download/v1.0.1/sloppy-x86_64-unknown-linux-gnu"
      sha256 "7fbf21317113a144298483b8acf801db601d9f2a0e61ea91aa9043875a86f750"
    end
  end

  def install
    bin.install Dir["sloppy*"].first => "sloppy"
  end

  test do
    assert_match "sloppy", shell_output("\#{bin}/sloppy --version")
  end
end
