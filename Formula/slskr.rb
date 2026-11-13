class Slskr < Formula
  desc "Rust Soulseek daemon with bundled Web UI"
  homepage "https://github.com/snapetech-org/slskr"
  license "AGPL-3.0-only"
  version "0.2.104"

  on_macos do
    on_arm do
      url "https://github.com/snapetech-org/slskr/releases/download/v0.2.104/slskr-v0.2.104-aarch64-apple-darwin.tar.gz"
      sha256 "68e49802a73ef94150dbf3482837e1a8fc7abb696ed27dd35b9a30ce66e7564a"
    end
    on_intel do
      url "https://github.com/snapetech-org/slskr/releases/download/v0.2.104/slskr-v0.2.104-x86_64-apple-darwin.tar.gz"
      sha256 "13c241aa32eb86c4f31607d3a037d638d874ed705ef94e4231b500a25570c4fa"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/snapetech-org/slskr/releases/download/v0.2.104/slskr-v0.2.104-aarch64-unknown-linux-musl.tar.gz"
      sha256 "1d0b0ef8fd69a2fbe414d1d0d572fbde7a376cfaa93ad9db9d648cac06a0bea5"
    else
      url "https://github.com/snapetech-org/slskr/releases/download/v0.2.104/slskr-v0.2.104-x86_64-unknown-linux-musl.tar.gz"
      sha256 "bfddd032e38a357acf838dcbdd900c25ddf59164947cfb50af8c22f11ad0ba5a"
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
