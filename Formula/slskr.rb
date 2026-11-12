class Slskr < Formula
  desc "Rust Soulseek daemon with bundled Web UI"
  homepage "https://github.com/snapetech-org/slskr"
  license "AGPL-3.0-only"
  version "0.2.95"

  on_macos do
    on_arm do
      url "https://github.com/snapetech-org/slskr/releases/download/v0.2.95/slskr-v0.2.95-aarch64-apple-darwin.tar.gz"
      sha256 "bcc738b9e70de7bebdebd4bb71d6ff8cf8363348abefc10c9aa435b76cd06a44"
    end
    on_intel do
      url "https://github.com/snapetech-org/slskr/releases/download/v0.2.95/slskr-v0.2.95-x86_64-apple-darwin.tar.gz"
      sha256 "3be475d189008b00a52c9bc3248f4224c25645b18ba8ea09fe23ede2bb3c2f34"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/snapetech-org/slskr/releases/download/v0.2.95/slskr-v0.2.95-aarch64-unknown-linux-musl.tar.gz"
      sha256 "a38abd21cafd9f05e7a7043cd8123f674caafb50e68833f9dc160915cccf94d2"
    else
      url "https://github.com/snapetech-org/slskr/releases/download/v0.2.95/slskr-v0.2.95-x86_64-unknown-linux-musl.tar.gz"
      sha256 "da331a6a2403c60c37c7f2240a251ab8195ae02315085e74b6d69f56a176700b"
    end
  end

  def install
    libexec.install Dir["*"]
    bin.write_exec_script libexec/"slskr"
  end

  test do
    assert_path_exists libexec/"slskr"
    assert_path_exists libexec/"web/build/index.html"
    assert_match "slskr", shell_output("#{bin}/slskr version")
  end
end
