class Slskdn < Formula
  desc "Unofficial slskd fork with batteries-included Soulseek features"
  homepage "https://github.com/snapetech/slskdn"
  license "AGPL-3.0-or-later"
  version "2026101818-slskdn.352"
  url "https://github.com/snapetech-org/slskdN/releases/download/2026101818-slskdn.352/slskdn-main-linux-glibc-x64.zip"
  sha256 "134e954a8ed60ab44a3b8b22e6bdb297ae220bd68a0fc8d043e61993a9341508"
  on_macos do
    on_arm do
      url "https://github.com/snapetech-org/slskdN/releases/download/2026101818-slskdn.352/slskdn-main-osx-arm64.zip"
      sha256 "5df6f34fb521eb1f3ca66572ece5396b3d5c9829c1aceb9bc260712be1481a64"
    end
    on_intel do
      url "https://github.com/snapetech-org/slskdN/releases/download/2026101818-slskdn.352/slskdn-main-osx-x64.zip"
      sha256 "e3f28489fd9ebbc32c18963aab62c3351297215b3c8d36b444453d7870c23444"
    end
  end
  on_linux do
    url "https://github.com/snapetech-org/slskdN/releases/download/2026101818-slskdn.352/slskdn-main-linux-glibc-x64.zip"
    sha256 "134e954a8ed60ab44a3b8b22e6bdb297ae220bd68a0fc8d043e61993a9341508"
  end
  def install
    libexec.install Dir["*"]
    (bin/"slskd").write_exec_script libexec/"slskd"
    (bin/"slskdn").write_exec_script libexec/"slskd"
  end
end
