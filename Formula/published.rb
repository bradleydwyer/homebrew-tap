class Published < Formula
  desc "App store name availability checker"
  homepage "https://github.com/bradleydwyer/published"
  version "1.0.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/published/releases/download/v1.0.1/published-aarch64-apple-darwin"
      sha256 "472a6caca9c34e3ed8f9ca8d2b8cbcd9c3bf1242d4667d56f6d89ecc4f14a96a"
    else
      url "https://github.com/bradleydwyer/published/releases/download/v1.0.1/published-x86_64-apple-darwin"
      sha256 "98ee339f2b426ad5f2743cef7bf9578031133b1bb1002468a686c3855799e74a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/published/releases/download/v1.0.1/published-aarch64-unknown-linux-gnu"
      sha256 "ff65aff7d295460c1f51810440305b6c277fbd4dabe8d520cf2b676af08d1d91"
    else
      url "https://github.com/bradleydwyer/published/releases/download/v1.0.1/published-x86_64-unknown-linux-gnu"
      sha256 "6c5e5a93a8a599e16399af1888696e1b3e37363df32fa5cff71f164adbfea8e2"
    end
  end

  def install
    bin.install Dir["published*"].first => "published"
  end

  test do
    assert_match "published", shell_output("#{bin}/published --version")
  end
end
