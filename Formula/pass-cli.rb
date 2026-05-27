class PassCli < Formula
  desc "Proton Pass CLI - Command-line interface for Proton Pass"
  homepage "https://proton.me/pass"
  version "2.1.1"
  license "GPL-3.0"

  on_macos do
    on_intel do
      url "https://proton.me/download/pass-cli/2.1.1/pass-cli-macos-x86_64"
      sha256 "a23b7781578d0220d655f745b40e89abf5b0a8cd3fa3537f2ec080c747abb8af"

      def install
        bin.install "pass-cli-macos-x86_64" => "pass-cli"
      end
    end

    on_arm do
      url "https://proton.me/download/pass-cli/2.1.1/pass-cli-macos-aarch64"
      sha256 "787b107dbfb759502460cac361724e2862d5082025fc02e902f436a92df050a9"

      def install
        bin.install "pass-cli-macos-aarch64" => "pass-cli"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://proton.me/download/pass-cli/2.1.1/pass-cli-linux-x86_64"
      sha256 "97eeed17907674cfde7b397157f14f3ae0d1391c82732062971f4b1333559a8f"

      def install
        bin.install "pass-cli-linux-x86_64" => "pass-cli"
      end
    end

    on_arm do
      url "https://proton.me/download/pass-cli/2.1.1/pass-cli-linux-aarch64"
      sha256 "d76579e5191ea4a56d8e254898c9c6c5242a7f3a3a5204dccb88f34409e4c9fb"

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
