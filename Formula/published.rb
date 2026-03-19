class Published < Formula
  desc "App store name availability checker"
  homepage "https://github.com/bradleydwyer/published"
  version "1.0.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/published/releases/download/v1.0.3/published-aarch64-apple-darwin"
      sha256 "bc6b52f8eb2c648616c02e8c2e86022e001fd7bb5fbf4e454bd9014de5350938"
    else
      url "https://github.com/bradleydwyer/published/releases/download/v1.0.3/published-x86_64-apple-darwin"
      sha256 "d28bad8cb0a9a0f7616a88ad6011742ac96837e8eabbe94bf65340c1ed1e1226"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/published/releases/download/v1.0.3/published-aarch64-unknown-linux-gnu"
      sha256 "92c86c39b60ab10c90aed0e9ac25a8fe8122569ce7bd03b3b545a0424fa31385"
    else
      url "https://github.com/bradleydwyer/published/releases/download/v1.0.3/published-x86_64-unknown-linux-gnu"
      sha256 "8024e0d4494d28088871fbfee51d94f26fe231b584e6ee8457e787e2d18a196d"
    end
  end

  def install
    bin.install Dir["published*"].first => "published"
  end

  test do
    assert_match "published", shell_output("#{bin}/published --version")
  end
end
