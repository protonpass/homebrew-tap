class PassCli < Formula
  desc "Proton Pass CLI - Command-line interface for Proton Pass"
  homepage "https://proton.me/pass"
  version "2.4.1"
  license "GPL-3.0"

  on_macos do
    on_intel do
      url "https://proton.me/download/pass-cli/2.4.1/pass-cli-macos-x86_64"
      sha256 "a3a61cf2f77dbd10bc9014704b15b45f6ebab7fdc363a669a04280fc38a789d0"

      def install
        bin.install "pass-cli-macos-x86_64" => "pass-cli"
      end
    end

    on_arm do
      url "https://proton.me/download/pass-cli/2.4.1/pass-cli-macos-aarch64"
      sha256 "4b1f8eaa92d44ccdddd2b6f716c8f3e0ed388cb28708059bbbc86170fc39539c"

      def install
        bin.install "pass-cli-macos-aarch64" => "pass-cli"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://proton.me/download/pass-cli/2.4.1/pass-cli-linux-x86_64"
      sha256 "f4188430466e0a3d668b56791a8b430162cb20ceb108fed4fdbfcfe77d3080e6"

      def install
        bin.install "pass-cli-linux-x86_64" => "pass-cli"
      end
    end

    on_arm do
      url "https://proton.me/download/pass-cli/2.4.1/pass-cli-linux-aarch64"
      sha256 "655a3f6c6ebf86b0bc67ccb2e099a0901a3adf13f8cc074d965886bfe70403fa"

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
