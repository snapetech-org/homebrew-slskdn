class Slskr < Formula
  desc "Rust Soulseek daemon with bundled Web UI"
  homepage "https://github.com/snapetech-org/slskr"
  license "AGPL-3.0-only"
  version "0.2.96"

  on_macos do
    on_arm do
      url "https://github.com/snapetech-org/slskr/releases/download/v0.2.96/slskr-v0.2.96-aarch64-apple-darwin.tar.gz"
      sha256 "28d471caae65c03945cce753a8070590a03b6d0a62660cdd1a69ad1902cea2b7"
    end
    on_intel do
      url "https://github.com/snapetech-org/slskr/releases/download/v0.2.96/slskr-v0.2.96-x86_64-apple-darwin.tar.gz"
      sha256 "3d57cd20407958fedfaa4521eec633cbf99f0c79af860268c8761772080fc8f0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/snapetech-org/slskr/releases/download/v0.2.96/slskr-v0.2.96-aarch64-unknown-linux-musl.tar.gz"
      sha256 "e98f5b8b7b955d1be0e155d1d385f003476208e88c36e4337f2583c43c7c4cd7"
    else
      url "https://github.com/snapetech-org/slskr/releases/download/v0.2.96/slskr-v0.2.96-x86_64-unknown-linux-musl.tar.gz"
      sha256 "7fbd189da8c331cb229dae1abe40b3739ee179a6e5dcf64d4f77dfc9600d2b1a"
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
