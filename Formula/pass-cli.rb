class PassCli < Formula
  desc "Proton Pass CLI - Command-line interface for Proton Pass"
  homepage "https://proton.me/pass"
  version "2.3.0"
  license "GPL-3.0"

  on_macos do
    on_intel do
      url "https://proton.me/download/pass-cli/2.3.0/pass-cli-macos-x86_64"
      sha256 "9bb2ee753d54db61c3a3449c76608e0ec75fa42f6ac59b2c25ecd419ec6f2e4e"

      def install
        bin.install "pass-cli-macos-x86_64" => "pass-cli"
      end
    end

    on_arm do
      url "https://proton.me/download/pass-cli/2.3.0/pass-cli-macos-aarch64"
      sha256 "e41b4b578d58a6f9e9077bea05d9ee3610503dff8cd9b01ee4bb1936f9c1c268"

      def install
        bin.install "pass-cli-macos-aarch64" => "pass-cli"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://proton.me/download/pass-cli/2.3.0/pass-cli-linux-x86_64"
      sha256 "b6e2886eb21f89358c1fb50f047a47d1329d50e29cdc2ead48701c61462bb81a"

      def install
        bin.install "pass-cli-linux-x86_64" => "pass-cli"
      end
    end

    on_arm do
      url "https://proton.me/download/pass-cli/2.3.0/pass-cli-linux-aarch64"
      sha256 "ae0f07cc5c49c22a481dc9fc705004b77d6859fd24234617255c7f4c90ea7cf0"

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
