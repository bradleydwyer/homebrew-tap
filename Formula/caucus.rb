class Caucus < Formula
  desc "Multi-LLM consensus engine — aggregate and synthesize LLM outputs"
  homepage "https://github.com/bradleydwyer/caucus"
  version "1.1.0"
  license "MIT"

  on_macos do
    url "https://github.com/bradleydwyer/caucus/releases/download/v1.1.0/caucus-aarch64-apple-darwin"
    sha256 "83d9665afeab0a7cfb430f77f4c021a568e73c9d33f0f480a3e3626f4c80da62"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/caucus/releases/download/v1.1.0/caucus-aarch64-unknown-linux-gnu"
      sha256 "cbce6bb9064e771bd62d0d373a50237e11ec4d3002f9d5d19702518baaee2b38"
    else
      url "https://github.com/bradleydwyer/caucus/releases/download/v1.1.0/caucus-x86_64-unknown-linux-gnu"
      sha256 "5e798dd2cf09afe32d1cc8eba745f5be6c635300bf8eb880abe89a7f12e029cd"
    end
  end

  def install
    bin.install Dir["caucus*"].first => "caucus"
  end

  test do
    assert_match "caucus", shell_output("\#{bin}/caucus --version")
  end
end
