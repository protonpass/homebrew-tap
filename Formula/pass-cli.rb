class PassCli < Formula
  desc "Proton Pass CLI - Command-line interface for Proton Pass"
  homepage "https://proton.me/pass"
  version "2.2.6"
  license "GPL-3.0"

  on_macos do
    on_intel do
      url "https://proton.me/download/pass-cli/2.2.6/pass-cli-macos-x86_64"
      sha256 "1c5abd68039919a4483fb230906429c741a0d957a1abcd3a9d428c07fb0ce738"

      def install
        bin.install "pass-cli-macos-x86_64" => "pass-cli"
      end
    end

    on_arm do
      url "https://proton.me/download/pass-cli/2.2.6/pass-cli-macos-aarch64"
      sha256 "53d38309bc7af64b5d197085cb9c2339d3eb684bb4a100700bdcab084f8da150"

      def install
        bin.install "pass-cli-macos-aarch64" => "pass-cli"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://proton.me/download/pass-cli/2.2.6/pass-cli-linux-x86_64"
      sha256 "cd4af40818954391f85038421a44a22230fd3c7c1ef57e39dc900721f42021c4"

      def install
        bin.install "pass-cli-linux-x86_64" => "pass-cli"
      end
    end

    on_arm do
      url "https://proton.me/download/pass-cli/2.2.6/pass-cli-linux-aarch64"
      sha256 "4a2b0d59e816351553b2712e3a291dea5c7da66148e763e6112549a672f26456"

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
