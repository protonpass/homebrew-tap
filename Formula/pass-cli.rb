class PassCli < Formula
  desc "Proton Pass CLI - Command-line interface for Proton Pass"
  homepage "https://proton.me/pass"
  version "1.1.1"
  license "GPL-3.0"

  on_macos do
    on_intel do
      url "https://proton.me/download/pass-cli/1.1.1/pass-cli-macos-x86_64"
      sha256 "88ec2cd62623c0e9b1fa5c821c77c35fc3437baf99ac33ce22d9fa593188ef19"

      def install
        bin.install "pass-cli-macos-x86_64" => "pass-cli"
      end
    end

    on_arm do
      url "https://proton.me/download/pass-cli/1.1.1/pass-cli-macos-aarch64"
      sha256 "289db3b1963889206dad4986423e8bdd5f92409795d6e4197d44e9dcbb37fe06"

      def install
        bin.install "pass-cli-macos-aarch64" => "pass-cli"
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
