class Caucus < Formula
  desc "Multi-LLM consensus engine — aggregate and synthesize LLM outputs"
  homepage "https://github.com/bradleydwyer/caucus"
  version "1.1.2"
  license "MIT"

  on_macos do
    url "https://github.com/bradleydwyer/caucus/releases/download/v1.1.2/caucus-aarch64-apple-darwin"
    sha256 "86d35404da2e8a2ef5ab93ab702a67016352292a557585b66c0cd7124d05abaa"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/caucus/releases/download/v1.1.2/caucus-aarch64-unknown-linux-gnu"
      sha256 "7533a71af407534723300ed6602f33eb260fb716f3a60ac6ca37d38984463ddf"
    else
      url "https://github.com/bradleydwyer/caucus/releases/download/v1.1.2/caucus-x86_64-unknown-linux-gnu"
      sha256 "698aad38e0faf8c5ca2ba878ea5fb0faec4390451f3150bd06213ec0691b55fe"
    end
  end

  def install
    bin.install Dir["caucus*"].first => "caucus"
  end

  test do
    assert_match "caucus", shell_output("\#{bin}/caucus --version")
  end
end
