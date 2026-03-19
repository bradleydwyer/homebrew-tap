class Published < Formula
  desc "App store name availability checker"
  homepage "https://github.com/bradleydwyer/published"
  version "1.1.0"
  license "MIT"

  on_macos do
    url "https://github.com/bradleydwyer/published/releases/download/v1.1.0/published-aarch64-apple-darwin"
    sha256 "81223ab81f567a4cfa2e88f8bff22ac49647a3357569bfb34a84b5a84df08b55"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/published/releases/download/v1.1.0/published-aarch64-unknown-linux-gnu"
      sha256 "3b80a0dbfb88f7bee693f6f13a8e72f7bbb29a185ae3fb1af52161077d0cda1d"
    else
      url "https://github.com/bradleydwyer/published/releases/download/v1.1.0/published-x86_64-unknown-linux-gnu"
      sha256 "2520304794ae8388fb3b9dfe0e24ae77fd27cd8516b6027c118081668a6380cf"
    end
  end

  def install
    bin.install Dir["published*"].first => "published"
  end

  test do
    assert_match "published", shell_output("#{bin}/published --version")
  end
end
