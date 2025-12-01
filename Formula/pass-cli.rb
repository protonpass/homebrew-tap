class PassCli < Formula
  desc "Proton Pass CLI - Command-line interface for Proton Pass"
  homepage "https://proton.me/pass"
  version "1.1.0"
  license "GPL-3.0"
  on_macos do
    on_intel do
      url "https://proton.me/download/pass-cli/1.1.0/pass-cli-macos-x86_64"
      sha256 "b439a7a3fa75186d4b7bd3f0911832e9b5b62c78e1efb2bdab1e0a8ff18ab834"
      def install
        bin.install "pass-cli-macos-x86_64" => "pass-cli"
      end
    end
    on_arm do
      url "https://proton.me/download/pass-cli/1.1.0/pass-cli-macos-aarch64"
      sha256 "2a4d16d6b68c2328590be5459b3c36152f9f9c218cecc278f5fa000f3ca27f8f"
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