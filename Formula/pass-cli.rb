class PassCli < Formula
  desc "Proton Pass CLI - Command-line interface for Proton Pass"
  homepage "https://proton.me/pass"
  version "2.5.1"
  license "GPL-3.0"

  on_macos do
    on_intel do
      url "https://proton.me/download/pass-cli/2.5.1/pass-cli-macos-x86_64"
      sha256 "fed0d6a919b8b05921c508cdd4cfe8c05a0b0cf4ccc55ed036e3b51ace6f7373"

      def install
        bin.install "pass-cli-macos-x86_64" => "pass-cli"
      end
    end

    on_arm do
      url "https://proton.me/download/pass-cli/2.5.1/pass-cli-macos-aarch64"
      sha256 "2c5834dd21bef341db70c39eaa0a353d4b9e49a8a0d4e5579c02f62ed70db3d9"

      def install
        bin.install "pass-cli-macos-aarch64" => "pass-cli"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://proton.me/download/pass-cli/2.5.1/pass-cli-linux-x86_64"
      sha256 "40e27645e0485f5f0db928b81469d1c5a7c8968a162956e940069476244c02b1"

      def install
        bin.install "pass-cli-linux-x86_64" => "pass-cli"
      end
    end

    on_arm do
      url "https://proton.me/download/pass-cli/2.5.1/pass-cli-linux-aarch64"
      sha256 "03042c8ad70b21fa1da834f2e4e74484710ab3f05754af10c5035acdf68f3c87"

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
