class Slskr < Formula
  desc "Rust Soulseek daemon with bundled Web UI"
  homepage "https://github.com/snapetech/slskr"
  license "AGPL-3.0-only"
  version "0.2.56"

  on_macos do
    on_arm do
      url "https://github.com/snapetech/slskr/releases/download/release-v0.2.56/slskr-v0.2.56-aarch64-apple-darwin.tar.gz"
      sha256 "c676b3a946c2cefb115e2373fb3e9959dfa4a01b4939581ade18676d9b10861c"
    end
    on_intel do
      url "https://github.com/snapetech/slskr/releases/download/release-v0.2.56/slskr-v0.2.56-x86_64-apple-darwin.tar.gz"
      sha256 "2f637b14e3ec131b7c1f75f703bc69b7022f3792f84fe173c7b89bd94fd3e107"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/snapetech/slskr/releases/download/release-v0.2.56/slskr-v0.2.56-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "06d842b5b96fc9364d733998759dfe329b3afa7e9e85a3f894c090894d8cb5f8"
    else
      url "https://github.com/snapetech/slskr/releases/download/release-v0.2.56/slskr-v0.2.56-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5fa91b9be0e9a76e90ce1160fceb3775a2aa3a56ebfd808afb945630d105bab6"
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
