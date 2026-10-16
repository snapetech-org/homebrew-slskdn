class Slskr < Formula
  desc "Rust Soulseek daemon with bundled Web UI"
  homepage "https://github.com/snapetech-org/slskr"
  license "AGPL-3.0-only"
  version "0.2.68"

  on_macos do
    on_arm do
      url "https://github.com/snapetech-org/slskr/releases/download/release-v0.2.68/slskr-v0.2.68-aarch64-apple-darwin.tar.gz"
      sha256 "5077b0ac219ff3631f97e188c746b12a0ec87778e1a043f51df4894a0a0c7ad4"
    end
    on_intel do
      url "https://github.com/snapetech-org/slskr/releases/download/release-v0.2.68/slskr-v0.2.68-x86_64-apple-darwin.tar.gz"
      sha256 "6a67c563fbda5a529d1388aea4f7cba5c0efdd97ad98b9552c13fc52915fb8f8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/snapetech-org/slskr/releases/download/release-v0.2.68/slskr-v0.2.68-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3a0fef758bc1538b67d58b683d9031e6f5be409e68059c2b8024573920d57976"
    else
      url "https://github.com/snapetech-org/slskr/releases/download/release-v0.2.68/slskr-v0.2.68-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a3b5d498b348f86c40c8bcb4fec45528052c106811592ac612d94db6fa56d4a6"
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
