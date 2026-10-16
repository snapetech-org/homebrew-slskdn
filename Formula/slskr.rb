class Slskr < Formula
  desc "Rust Soulseek daemon with bundled Web UI"
  homepage "https://github.com/snapetech-org/slskr"
  license "AGPL-3.0-only"
  version "0.2.67"

  on_macos do
    on_arm do
      url "https://github.com/snapetech-org/slskr/releases/download/release-v0.2.67/slskr-v0.2.67-aarch64-apple-darwin.tar.gz"
      sha256 "d8099519cd8da5f170cc8ec6623c9a2bd280b8b7568a194ebf555b909b2e3641"
    end
    on_intel do
      url "https://github.com/snapetech-org/slskr/releases/download/release-v0.2.67/slskr-v0.2.67-x86_64-apple-darwin.tar.gz"
      sha256 "547bb068d2288de7830c70671c4991006ba776eacd5e47948bbf25d540725829"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/snapetech-org/slskr/releases/download/release-v0.2.67/slskr-v0.2.67-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b00d093650cc11688c2b03587b6d367b90925af480e7ee477d6d7f7347b6b33d"
    else
      url "https://github.com/snapetech-org/slskr/releases/download/release-v0.2.67/slskr-v0.2.67-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "361652fc9329e0d520fd620165f74ef1f7b6755d2f39872383ea21a5e562ce3d"
    end
  end

  def install
    libexec.install Dir["*"]
    bin.install libexec/"slskr"
  end

  test do
    assert_match "slskr", shell_output("#{bin}/slskr version")
  end
end
