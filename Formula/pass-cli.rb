class PassCli < Formula
  desc "Proton Pass CLI - Command-line interface for Proton Pass"
  homepage "https://proton.me/pass"
  version "2.4.2"
  license "GPL-3.0"

  on_macos do
    on_intel do
      url "https://proton.me/download/pass-cli/2.4.2/pass-cli-macos-x86_64"
      sha256 "44f7cd45bdfabe34079e6d6ba2ff54e3a3e9e3150046b6cbee326cad52edff18"

      def install
        bin.install "pass-cli-macos-x86_64" => "pass-cli"
      end
    end

    on_arm do
      url "https://proton.me/download/pass-cli/2.4.2/pass-cli-macos-aarch64"
      sha256 "99e862094fd2a4f82788c9000ba5a92246e7739f86c35a84655b9d7e2adf7227"

      def install
        bin.install "pass-cli-macos-aarch64" => "pass-cli"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://proton.me/download/pass-cli/2.4.2/pass-cli-linux-x86_64"
      sha256 "4089bdf5981140ac5bee65d2d79bf98767537f54d33197b79e5f86c630714842"

      def install
        bin.install "pass-cli-linux-x86_64" => "pass-cli"
      end
    end

    on_arm do
      url "https://proton.me/download/pass-cli/2.4.2/pass-cli-linux-aarch64"
      sha256 "eee38fc4549a5dfcbb794aafcb6d517c9e0cd0dc3c53bbb2997fd8142ed681c7"

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
