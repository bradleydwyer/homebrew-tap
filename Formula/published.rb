class Published < Formula
  desc "App store name availability checker"
  homepage "https://github.com/bradleydwyer/published"
  version "1.0.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/published/releases/download/v1.0.2/published-aarch64-apple-darwin"
      sha256 "dd775774aeda51f40379ad05c962c097834358ec12b6c8ed9e7fe659c0e1a14e"
    else
      url "https://github.com/bradleydwyer/published/releases/download/v1.0.2/published-x86_64-apple-darwin"
      sha256 "454cebb5682e4528963977655f01ef195df92725770514522fc2fd8e6258eb7d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/published/releases/download/v1.0.2/published-aarch64-unknown-linux-gnu"
      sha256 "51694a676425a17f60646f95d0dcf5b74ec510e2f9731e1bfac6b4fc8779b8a6"
    else
      url "https://github.com/bradleydwyer/published/releases/download/v1.0.2/published-x86_64-unknown-linux-gnu"
      sha256 "dd54c38aebc7f5cd58a4e32ef687c490d5b82f520cc6b09f308bad10d6836722"
    end
  end

  def install
    bin.install Dir["published*"].first => "published"
  end

  test do
    assert_match "published", shell_output("#{bin}/published --version")
  end
end
