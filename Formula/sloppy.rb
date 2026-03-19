class Sloppy < Formula
  desc "Fast regex-based detection of AI prose tells"
  homepage "https://github.com/bradleydwyer/sloppy"
  version "1.0.3"
  license "MIT"

  on_macos do
    url "https://github.com/bradleydwyer/sloppy/releases/download/v1.0.3/sloppy-aarch64-apple-darwin"
    sha256 "e52a8b87e41398f1e4eed76dbb6efa27105da31daba0c3916c05c456a3fc6875"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/sloppy/releases/download/v1.0.3/sloppy-aarch64-unknown-linux-gnu"
      sha256 "4b08cd4a6c40763fd97139a534d87f5e60f410f56e2ce917996c111ccb7a2f15"
    else
      url "https://github.com/bradleydwyer/sloppy/releases/download/v1.0.3/sloppy-x86_64-unknown-linux-gnu"
      sha256 "2bbd1dee1d3a2b7f42e0832531748f51c92d05be90927d7d447cc70485945742"
    end
  end

  def install
    bin.install Dir["sloppy*"].first => "sloppy"
  end

  test do
    assert_match "sloppy", shell_output("\#{bin}/sloppy --version")
  end
end
