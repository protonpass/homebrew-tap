class PassCli < Formula
  desc "Proton Pass CLI - Command-line interface for Proton Pass"
  homepage "https://proton.me/pass"
  version "2.1.0"
  license "GPL-3.0"

  on_macos do
    on_intel do
      url "https://proton.me/download/pass-cli/2.1.0/pass-cli-macos-x86_64"
      sha256 "893e77702b24498f3e02f2d759019ca859254092413b577b005304218103965a"

      def install
        bin.install "pass-cli-macos-x86_64" => "pass-cli"
      end
    end

    on_arm do
      url "https://proton.me/download/pass-cli/2.1.0/pass-cli-macos-aarch64"
      sha256 "e4541297a5ea8a99ba316ab69336b61555d26a35f8c4207882a68079de343682"

      def install
        bin.install "pass-cli-macos-aarch64" => "pass-cli"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://proton.me/download/pass-cli/2.1.0/pass-cli-linux-x86_64"
      sha256 "5a775d5f83affbd8c1bcbf1517c38d1a157c160133e7136b00d5311bafe8ba93"

      def install
        bin.install "pass-cli-linux-x86_64" => "pass-cli"
      end
    end

    on_arm do
      url "https://proton.me/download/pass-cli/2.1.0/pass-cli-linux-aarch64"
      sha256 "e1481c47dc95fe241a42841414345afb2cd208520893f49a3c23897538293102"

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
