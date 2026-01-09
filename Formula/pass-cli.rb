class PassCli < Formula
  desc "Proton Pass CLI - Command-line interface for Proton Pass"
  homepage "https://proton.me/pass"
  version "1.3.3"
  license "GPL-3.0"

  on_macos do
    on_intel do
      url "https://proton.me/download/pass-cli/1.3.3/pass-cli-macos-x86_64"
      sha256 "2584261cd70fa5a253247abeaaccb6634e924abd7430e44456fb540d620b47bf"

      def install
        bin.install "pass-cli-macos-x86_64" => "pass-cli"
      end
    end

    on_arm do
      url "https://proton.me/download/pass-cli/1.3.3/pass-cli-macos-aarch64"
      sha256 "24f8c9b1b3ef989f3780ec3dc72ed0112b58ff4d17f5a707ba43b1e96fccf183"

      def install
        bin.install "pass-cli-macos-aarch64" => "pass-cli"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://proton.me/download/pass-cli/1.3.1/pass-cli-linux-x86_64"
      sha256 "22f916541e5d35758660fae357c939e3719d5b63f9e82ab0666b6affe1a2fc13"

      def install
        bin.install "pass-cli-linux-x86_64" => "pass-cli"
      end
    end

    on_arm do
      url "https://proton.me/download/pass-cli/1.3.1/pass-cli-linux-aarch64"
      sha256 "20012e31c5af260eaa16cc7610c94200a8b34e5f68d559837530f1a1e51dfb13"

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
