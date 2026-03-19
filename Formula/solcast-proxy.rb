class SolcastProxy < Formula
  desc "Caching reverse proxy for the Solcast solar forecast API"
  homepage "https://github.com/bradleydwyer/solcast-proxy"
  version "1.0.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/solcast-proxy/releases/download/v1.0.4/solcast-proxy-aarch64-apple-darwin"
      sha256 "531a87107ad104d008a7c001d82c2524fb54bc58afe27d547fd2cf94729f9fe8"
    else
      url "https://github.com/bradleydwyer/solcast-proxy/releases/download/v1.0.4/solcast-proxy-x86_64-apple-darwin"
      sha256 "c4c4635c3302acce611bb5f5edb9a9c87c69ccde3a70c5a11882d40269b64415"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/solcast-proxy/releases/download/v1.0.4/solcast-proxy-aarch64-unknown-linux-gnu"
      sha256 "2f4afad72f63daa568183fe9858b235e0919eac34854fb32ef5ec58b7429a04e"
    else
      url "https://github.com/bradleydwyer/solcast-proxy/releases/download/v1.0.4/solcast-proxy-x86_64-unknown-linux-gnu"
      sha256 "05df259b8fa8222b2769904be4061a0348786e860492c49208f0e7a2e56cf617"
    end
  end

  def install
    bin.install Dir["solcast-proxy*"].first => "solcast-proxy"
  end

  test do
    assert_match "solcast-proxy", shell_output("\#{bin}/solcast-proxy --version")
  end
end
