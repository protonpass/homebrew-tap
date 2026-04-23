class PassCli < Formula
  desc "Proton Pass CLI - Command-line interface for Proton Pass"
  homepage "https://proton.me/pass"
  version "2.0.2"
  license "GPL-3.0"

  on_macos do
    on_intel do
      url "https://proton.me/download/pass-cli/2.0.2/pass-cli-macos-x86_64"
      sha256 "a975ca6af19177a2d274b7a8222c2510d84e13d252fd9c50bf8df67e54b42818"

      def install
        bin.install "pass-cli-macos-x86_64" => "pass-cli"
      end
    end

    on_arm do
      url "https://proton.me/download/pass-cli/2.0.2/pass-cli-macos-aarch64"
      sha256 "0bfd99c4d8270ce2c2913c93a823c620a8975e3c2f1ce24d234e41706cb5cf47"

      def install
        bin.install "pass-cli-macos-aarch64" => "pass-cli"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://proton.me/download/pass-cli/2.0.2/pass-cli-linux-x86_64"
      sha256 "fd60a5041e642a7b1135ef6878c3d7ce3523b083210ea8100eee5c3701017ed9"

      def install
        bin.install "pass-cli-linux-x86_64" => "pass-cli"
      end
    end

    on_arm do
      url "https://proton.me/download/pass-cli/2.0.2/pass-cli-linux-aarch64"
      sha256 "c12c531adb823d4eae4f6e69065c6e767b10ed71328a1b3fa625a4897ae3b38c"

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
