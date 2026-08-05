class PassCli < Formula
  desc "Proton Pass CLI - Command-line interface for Proton Pass"
  homepage "https://proton.me/pass"
  version "2.2.5"
  license "GPL-3.0"

  on_macos do
    on_intel do
      url "https://proton.me/download/pass-cli/2.2.5/pass-cli-macos-x86_64"
      sha256 "823e474bbba634e1637509003ad7f60caf32be0ee5fc6d4d35d6ab7dcc89d171"

      def install
        bin.install "pass-cli-macos-x86_64" => "pass-cli"
      end
    end

    on_arm do
      url "https://proton.me/download/pass-cli/2.2.5/pass-cli-macos-aarch64"
      sha256 "bbaac0992124471a0ca1cc2624fce81fdac5c5d50e8f31a6bb729f771f7f36e1"

      def install
        bin.install "pass-cli-macos-aarch64" => "pass-cli"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://proton.me/download/pass-cli/2.2.5/pass-cli-linux-x86_64"
      sha256 "3971bfdb5649bc59634c2195e35259ea3f4b7889bba5a4f6698b6af50b27cf7f"

      def install
        bin.install "pass-cli-linux-x86_64" => "pass-cli"
      end
    end

    on_arm do
      url "https://proton.me/download/pass-cli/2.2.5/pass-cli-linux-aarch64"
      sha256 "a8597eaf92631242a44c5b9b13b0fd0c0fc56b21a6c4f087b7d4c031651249b3"

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
