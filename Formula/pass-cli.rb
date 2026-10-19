class PassCli < Formula
  desc "Proton Pass CLI - Command-line interface for Proton Pass"
  homepage "https://proton.me/pass"
  version "2.5.0"
  license "GPL-3.0"

  on_macos do
    on_intel do
      url "https://proton.me/download/pass-cli/2.5.0/pass-cli-macos-x86_64"
      sha256 "d83e13609286cc6f648d621b9920b25f44b1c757a7c26075eb958c30cc21485c"

      def install
        bin.install "pass-cli-macos-x86_64" => "pass-cli"
      end
    end

    on_arm do
      url "https://proton.me/download/pass-cli/2.5.0/pass-cli-macos-aarch64"
      sha256 "8d99e78f6f2e470df7d972c981dbe6da9b2d322c093cf9d3048e54521e9ed70a"

      def install
        bin.install "pass-cli-macos-aarch64" => "pass-cli"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://proton.me/download/pass-cli/2.5.0/pass-cli-linux-x86_64"
      sha256 "9ce925d06407097337a01502f281d63a8bed80b7c54b96942dd665d4eb488cfd"

      def install
        bin.install "pass-cli-linux-x86_64" => "pass-cli"
      end
    end

    on_arm do
      url "https://proton.me/download/pass-cli/2.5.0/pass-cli-linux-aarch64"
      sha256 "052f131d8d071d36097fea084c7e5823358ad0ad8ab41195e6348fc10ec8192c"

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
