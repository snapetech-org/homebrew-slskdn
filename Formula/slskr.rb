class Slskr < Formula
  desc "Rust Soulseek daemon with bundled Web UI"
  homepage "https://github.com/snapetech-org/slskr"
  license "AGPL-3.0-only"
  version "0.2.94"

  on_macos do
    on_arm do
      url "https://github.com/snapetech-org/slskr/releases/download/v0.2.94/slskr-v0.2.94-aarch64-apple-darwin.tar.gz"
      sha256 "52767343a52bf0365f5fe0be21989e27d2d0532d45c21e59808c985478d83e91"
    end
    on_intel do
      url "https://github.com/snapetech-org/slskr/releases/download/v0.2.94/slskr-v0.2.94-x86_64-apple-darwin.tar.gz"
      sha256 "928dc9c77ce0bf3900192ed217fb890eb846a8c6ed3c3a9c54b99d33845c8ab3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/snapetech-org/slskr/releases/download/v0.2.94/slskr-v0.2.94-aarch64-unknown-linux-musl.tar.gz"
      sha256 "7bf8494089a6fe73d7f747f30b0b337ec5f0ba37164fd9e4b00a9accd1a78a72"
    else
      url "https://github.com/snapetech-org/slskr/releases/download/v0.2.94/slskr-v0.2.94-x86_64-unknown-linux-musl.tar.gz"
      sha256 "335480952ca8b9ae9eba5790db3d6f6c4b6b55e1ddc710973bd2d90c763c858b"
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
