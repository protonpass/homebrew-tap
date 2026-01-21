class PassCli < Formula
  desc "Proton Pass CLI - Command-line interface for Proton Pass"
  homepage "https://proton.me/pass"
  version "1.4.1"
  license "GPL-3.0"

  on_macos do
    on_intel do
      url "https://proton.me/download/pass-cli/1.4.1/pass-cli-macos-x86_64"
      sha256 "ceffa547d14af8ea5acf0963f11ef0d60ee0bd37fd7ed34a4c70ef86d82ad035"

      def install
        bin.install "pass-cli-macos-x86_64" => "pass-cli"
      end
    end

    on_arm do
      url "https://proton.me/download/pass-cli/1.4.1/pass-cli-macos-aarch64"
      sha256 "7019050f490d8289c045eca39a6abf3fd480f6bcc3fa7807831241b4ec13d7f1"

      def install
        bin.install "pass-cli-macos-aarch64" => "pass-cli"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://proton.me/download/pass-cli/1.3.1/pass-cli-linux-x86_64"
      sha256 "22f916541e5d35758660fae357c939e3719d5b63f9e82ab0666b6affe1a2fc13"

      def install
        bin.install "pass-cli-linux-x86_64" => "pass-cli"
      end
    end

    on_arm do
      url "https://proton.me/download/pass-cli/1.3.1/pass-cli-linux-aarch64"
      sha256 "20012e31c5af260eaa16cc7610c94200a8b34e5f68d559837530f1a1e51dfb13"

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
