class Caucus < Formula
  desc "Multi-LLM consensus engine — aggregate and synthesize LLM outputs"
  homepage "https://github.com/bradleydwyer/caucus"
  version "1.1.3"
  license "MIT"

  on_macos do
    url "https://github.com/bradleydwyer/caucus/releases/download/v1.1.3/caucus-aarch64-apple-darwin"
    sha256 "84455f1f7e752da3afc1e975373b4ac6088f22291c741111766290adcb61cfee"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/caucus/releases/download/v1.1.3/caucus-aarch64-unknown-linux-gnu"
      sha256 "cbb1bdee5262bd6287181c9ef2868d736b9833c16b6acc84a9ce2876d53951bc"
    else
      url "https://github.com/bradleydwyer/caucus/releases/download/v1.1.3/caucus-x86_64-unknown-linux-gnu"
      sha256 "ef708607e61b077b7bebb9a503d80044e9d9625d3bb5d0025d74c6a1586061cd"
    end
  end

  def install
    bin.install Dir["caucus*"].first => "caucus"
  end

  test do
    assert_match "caucus", shell_output("\#{bin}/caucus --version")
  end
end
