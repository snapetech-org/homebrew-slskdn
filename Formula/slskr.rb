class Slskr < Formula
  desc "Rust Soulseek daemon with bundled Web UI"
  homepage "https://github.com/snapetech-org/slskr"
  license "AGPL-3.0-only"
  version "0.2.71"

  on_macos do
    on_arm do
      url "https://github.com/snapetech-org/slskr/releases/download/release-v0.2.71/slskr-v0.2.71-aarch64-apple-darwin.tar.gz"
      sha256 "c0a84e8ed42aa1a0f5ddcafb96eb39f51ce2fd6f5def7b53d028240c384e015d"
    end
    on_intel do
      url "https://github.com/snapetech-org/slskr/releases/download/release-v0.2.71/slskr-v0.2.71-x86_64-apple-darwin.tar.gz"
      sha256 "8d3b0f72afce9919e088f5b9c6368d885598f82a5845d050f6ebd71f32c62863"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/snapetech-org/slskr/releases/download/release-v0.2.71/slskr-v0.2.71-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "59e58c09fd448591f8645a8336e10183db998527515f1665342e123be1711039"
    else
      url "https://github.com/snapetech-org/slskr/releases/download/release-v0.2.71/slskr-v0.2.71-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "efa3ba418d70b1c1c6466cf1d5742b4df18649f4e6c56c1442ab39ffd3621579"
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
