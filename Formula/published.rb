class Published < Formula
  desc "App store name availability checker"
  homepage "https://github.com/bradleydwyer/published"
  version "1.0.4"
  license "MIT"

  on_macos do
    url "https://github.com/bradleydwyer/published/releases/download/v1.0.4/published-aarch64-apple-darwin"
    sha256 "ea80f3feaf038a2cf8c51b0da8dcc74bf216bf395f86160f48eebb21252218c7"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/published/releases/download/v1.0.4/published-aarch64-unknown-linux-gnu"
      sha256 "46e16e3a9ab2149ea9c86da6e52f2eb43d593af0e49b635120e78f4314eac238"
    else
      url "https://github.com/bradleydwyer/published/releases/download/v1.0.4/published-x86_64-unknown-linux-gnu"
      sha256 "336df33f37ccb2841e1946f4d08d235ddabb830498f926bb140653892f35c707"
    end
  end

  def install
    bin.install Dir["published*"].first => "published"
  end

  test do
    assert_match "published", shell_output("#{bin}/published --version")
  end
end
