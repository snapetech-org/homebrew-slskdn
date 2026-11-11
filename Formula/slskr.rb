class Slskr < Formula
  desc "Rust Soulseek daemon with bundled Web UI"
  homepage "https://github.com/snapetech-org/slskr"
  license "AGPL-3.0-only"
  version "0.2.90"

  on_macos do
    on_arm do
      url "https://github.com/snapetech-org/slskr/releases/download/v0.2.90/slskr-v0.2.90-aarch64-apple-darwin.tar.gz"
      sha256 "1bcccf52aa204dc5a7715ea8a4b563c29bd75547b0ff3173ca9d738a90e9684d"
    end
    on_intel do
      url "https://github.com/snapetech-org/slskr/releases/download/v0.2.90/slskr-v0.2.90-x86_64-apple-darwin.tar.gz"
      sha256 "90b41ee8c3093a150f0a13308d6060bc0090ca544480824af15786fe0ff76c32"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/snapetech-org/slskr/releases/download/v0.2.90/slskr-v0.2.90-aarch64-unknown-linux-musl.tar.gz"
      sha256 "c4a8a55ec70ec682bf1946abbe911c466fdebe1574ed3ebbf1b12d3c2ee18b0f"
    else
      url "https://github.com/snapetech-org/slskr/releases/download/v0.2.90/slskr-v0.2.90-x86_64-unknown-linux-musl.tar.gz"
      sha256 "dad84a6b123eb2b36093fe775f4ba148a3655023f1fa537118f3ebdd25f33872"
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
