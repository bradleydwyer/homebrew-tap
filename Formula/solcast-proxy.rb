class SolcastProxy < Formula
  desc "Caching reverse proxy for the Solcast solar forecast API"
  homepage "https://github.com/bradleydwyer/solcast-proxy"
  version "1.0.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/solcast-proxy/releases/download/v1.0.3/solcast-proxy-aarch64-apple-darwin"
      sha256 "447d7023f441ec3245fc6af305160c334c471378fb7ce92ad953fb21a71c68b0"
    else
      url "https://github.com/bradleydwyer/solcast-proxy/releases/download/v1.0.3/solcast-proxy-x86_64-apple-darwin"
      sha256 "0e374d7fda5f13c2fe58d1a0dc0a1730429ca106865d89177f92c7a5adc80f34"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/solcast-proxy/releases/download/v1.0.3/solcast-proxy-aarch64-unknown-linux-gnu"
      sha256 "954b805a62deba87624f26fc42e222d99269b8292b1a84969a0bbb19594e3f19"
    else
      url "https://github.com/bradleydwyer/solcast-proxy/releases/download/v1.0.3/solcast-proxy-x86_64-unknown-linux-gnu"
      sha256 "6dddd4ddfa740f3d1cc48cc72c032c7782aa9116be6bf918dd4b4bfab058a830"
    end
  end

  def install
    bin.install Dir["solcast-proxy*"].first => "solcast-proxy"
  end

  test do
    assert_match "solcast-proxy", shell_output("\#{bin}/solcast-proxy --version")
  end
end
