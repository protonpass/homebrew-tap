class PassCli < Formula
  desc "Proton Pass CLI - Command-line interface for Proton Pass"
  homepage "https://proton.me/pass"
  version "2.2.1"
  license "GPL-3.0"

  on_macos do
    on_intel do
      url "https://proton.me/download/pass-cli/2.2.1/pass-cli-macos-x86_64"
      sha256 "f65a64a61e90baea7ba256d9b14720168f0440f5b3d630d16d27df35b455479a"

      def install
        bin.install "pass-cli-macos-x86_64" => "pass-cli"
      end
    end

    on_arm do
      url "https://proton.me/download/pass-cli/2.2.1/pass-cli-macos-aarch64"
      sha256 "fafd72f20c45cb816793f48d8623ce6eb9d06478431923767d36776fde8b450e"

      def install
        bin.install "pass-cli-macos-aarch64" => "pass-cli"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://proton.me/download/pass-cli/2.2.1/pass-cli-linux-x86_64"
      sha256 "f916cf0d584503468e4cecb412b78657b55453822984173fcb9656a3d1a78ce6"

      def install
        bin.install "pass-cli-linux-x86_64" => "pass-cli"
      end
    end

    on_arm do
      url "https://proton.me/download/pass-cli/2.2.1/pass-cli-linux-aarch64"
      sha256 "5bfa922b289e61333d708c75c77a9dbd7d056f004c838d823bc948acdfb1a5ad"

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
