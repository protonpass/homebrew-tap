class PassCli < Formula
  desc "Proton Pass CLI - Command-line interface for Proton Pass"
  homepage "https://proton.me/pass"
  version "2.2.3"
  license "GPL-3.0"

  on_macos do
    on_intel do
      url "https://proton.me/download/pass-cli/2.2.3/pass-cli-macos-x86_64"
      sha256 "2babdfaf4badf1c428d66acd784377e5a9312c8a35b1fb6dea19e7eb051ae839"

      def install
        bin.install "pass-cli-macos-x86_64" => "pass-cli"
      end
    end

    on_arm do
      url "https://proton.me/download/pass-cli/2.2.3/pass-cli-macos-aarch64"
      sha256 "8318e5af39d899780214ec62c6d1c2cfdc7628bb2036dba8f72af74c9a63c732"

      def install
        bin.install "pass-cli-macos-aarch64" => "pass-cli"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://proton.me/download/pass-cli/2.2.3/pass-cli-linux-x86_64"
      sha256 "7188f02a7c1e79a860f7166ad2c34f7a2e6c961265b70677e2704f216dd176d9"

      def install
        bin.install "pass-cli-linux-x86_64" => "pass-cli"
      end
    end

    on_arm do
      url "https://proton.me/download/pass-cli/2.2.3/pass-cli-linux-aarch64"
      sha256 "35d05a6f37adb882446eef3545f837854544c3c049d80dd6868fe2d3cfeac0cb"

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
