class Available < Formula
  desc "AI-powered project name finder with domain and package registry checks"
  homepage "https://github.com/bradleydwyer/available"
  version "1.2.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/available/releases/download/v1.2.4/available-aarch64-apple-darwin"
      sha256 "4a4bda049eeb0eb2b4cda45fc87c485be1e9aa5e65993e4643e2111bd61863ba"
    else
      url "https://github.com/bradleydwyer/available/releases/download/v1.2.4/available-x86_64-apple-darwin"
      sha256 "b3167b85b93880688c9a30d656187d4d596cca2298a71d2087ea933e440cc3c6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/available/releases/download/v1.2.4/available-aarch64-unknown-linux-gnu"
      sha256 "e7fcb9d7fbe61b04600dc4032a5e9f51436e12524fb932b1cefbdc771fc30666"
    else
      url "https://github.com/bradleydwyer/available/releases/download/v1.2.4/available-x86_64-unknown-linux-gnu"
      sha256 "ba8118be4b7ce4a33ebbad23155634ebcf7047cbb3c4f6bbf984f3e05370c661"
    end
  end

  def install
    bin.install Dir["available*"].first => "available"
  end

  test do
    assert_match "available", shell_output("\#{bin}/available --version")
  end
end
