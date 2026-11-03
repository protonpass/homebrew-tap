class PassCli < Formula
  desc "Proton Pass CLI - Command-line interface for Proton Pass"
  homepage "https://proton.me/pass"
  version "2.7.0"
  license "GPL-3.0"

  on_macos do
    on_intel do
      url "https://proton.me/download/pass-cli/2.7.0/pass-cli-macos-x86_64"
      sha256 "1829f7ecef108df5e14f92081cf4a4412c0fdc5be2034f9ee85d1e6745a62322"

      def install
        bin.install "pass-cli-macos-x86_64" => "pass-cli"
      end
    end

    on_arm do
      url "https://proton.me/download/pass-cli/2.7.0/pass-cli-macos-aarch64"
      sha256 "f17222619b4c4c4112eccc3796edea4bc0e4a341dc8960f7bb4023782adcc4a1"

      def install
        bin.install "pass-cli-macos-aarch64" => "pass-cli"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://proton.me/download/pass-cli/2.7.0/pass-cli-linux-x86_64"
      sha256 "fd933e76179a5a33b295853e9c6696e49e584fe2141b1aafc63a3d78c0791cdb"

      def install
        bin.install "pass-cli-linux-x86_64" => "pass-cli"
      end
    end

    on_arm do
      url "https://proton.me/download/pass-cli/2.7.0/pass-cli-linux-aarch64"
      sha256 "93918d5621593cac88956854d0f52cbc43851dcd9c01840ffe48a88b3be84c6b"

      def install
        bin.install "pass-cli-linux-aarch64" => "pass-cli"
      end
    end
  end

  def caveats
    <<~EOS
      The Proton Pass CLI has been installed as 'pass-cli'.

      To get started:
        pass-cli login

      For help:
        pass-cli --help

      Documentation: https://protonpass.github.io/pass-cli/
    EOS
  end

  test do
    output = shell_output("#{bin}/pass-cli --version")
    assert_match(/Proton Pass CLI #{version}/, output)
  end
end
