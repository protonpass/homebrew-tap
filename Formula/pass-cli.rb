class PassCli < Formula
  desc "Proton Pass CLI - Command-line interface for Proton Pass"
  homepage "https://proton.me/pass"
  version "2.1.3"
  license "GPL-3.0"

  on_macos do
    on_intel do
      url "https://proton.me/download/pass-cli/2.1.3/pass-cli-macos-x86_64"
      sha256 "9c2d4e29c0aa090abdef655696438272fe33098a954456e0f97f723f5cf0a8c5"

      def install
        bin.install "pass-cli-macos-x86_64" => "pass-cli"
      end
    end

    on_arm do
      url "https://proton.me/download/pass-cli/2.1.3/pass-cli-macos-aarch64"
      sha256 "a508a10eb146df0e4b55b700a93f0c4fb70996185c7c80201f00ffa323cb7043"

      def install
        bin.install "pass-cli-macos-aarch64" => "pass-cli"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://proton.me/download/pass-cli/2.1.3/pass-cli-linux-x86_64"
      sha256 "dbfbffe1c2077f9d28d86eb2c600ae9db1a004c604ec2670a40e624f6ae9047a"

      def install
        bin.install "pass-cli-linux-x86_64" => "pass-cli"
      end
    end

    on_arm do
      url "https://proton.me/download/pass-cli/2.1.3/pass-cli-linux-aarch64"
      sha256 "f74ac73a26a983c45f98bcc3ee4caa89a6a269b9ee43ad17f79891d6c055f208"

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
