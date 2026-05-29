class PassCli < Formula
  desc "Proton Pass CLI - Command-line interface for Proton Pass"
  homepage "https://proton.me/pass"
  version "2.1.2"
  license "GPL-3.0"

  on_macos do
    on_intel do
      url "https://proton.me/download/pass-cli/2.1.2/pass-cli-macos-x86_64"
      sha256 "5d902d825cbde5d00034ae06e1529429e389decb0891d8604fd46b0fb0c67500"

      def install
        bin.install "pass-cli-macos-x86_64" => "pass-cli"
      end
    end

    on_arm do
      url "https://proton.me/download/pass-cli/2.1.2/pass-cli-macos-aarch64"
      sha256 "2ae5bdf202f67e4b7f7886ddba44d267242fcd35ccb861a61acf860235de2250"

      def install
        bin.install "pass-cli-macos-aarch64" => "pass-cli"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://proton.me/download/pass-cli/2.1.2/pass-cli-linux-x86_64"
      sha256 "5291edd21d85d222538b91341345ae3b0a1479e254d42920c2bbbd34012c6243"

      def install
        bin.install "pass-cli-linux-x86_64" => "pass-cli"
      end
    end

    on_arm do
      url "https://proton.me/download/pass-cli/2.1.2/pass-cli-linux-aarch64"
      sha256 "0562625812f940bd4b7abd664b3bbcfefdeaf79d2f9b12f2d0a73be1ffc551ff"

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
