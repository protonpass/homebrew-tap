class PassCli < Formula
  desc "Proton Pass CLI - Command-line interface for Proton Pass"
  homepage "https://proton.me/pass"
  version "1.3.5"
  license "GPL-3.0"

  on_macos do
    on_intel do
      url "https://proton.me/download/pass-cli/1.3.5/pass-cli-macos-x86_64"
      sha256 "ed331c7a7e225fd9ebd2bc6617bbc5589d7db6434de5ded8a8898bd0b17d8e4c"

      def install
        bin.install "pass-cli-macos-x86_64" => "pass-cli"
      end
    end

    on_arm do
      url "https://proton.me/download/pass-cli/1.3.5/pass-cli-macos-aarch64"
      sha256 "23e41879f83a102c716faf110f28f0d1d2b8faf48ebeef2a43690f86e3e869b5"

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
