class PassCli < Formula
  desc "Proton Pass CLI - Command-line interface for Proton Pass"
  homepage "https://proton.me/pass"
  version "2.7.1"
  license "GPL-3.0"

  on_macos do
    on_intel do
      url "https://proton.me/download/pass-cli/2.7.1/pass-cli-macos-x86_64"
      sha256 "ea3a6a133292230008e577ebcdf1a0a604177fd9107fdee287c8ed84ef164cd9"

      def install
        bin.install "pass-cli-macos-x86_64" => "pass-cli"
      end
    end

    on_arm do
      url "https://proton.me/download/pass-cli/2.7.1/pass-cli-macos-aarch64"
      sha256 "0f5f749372c77f279f92463c56c3dda777fc3157e5f90ef49ade17bca7e46ba3"

      def install
        bin.install "pass-cli-macos-aarch64" => "pass-cli"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://proton.me/download/pass-cli/2.7.1/pass-cli-linux-x86_64"
      sha256 "3e9520fe79ab4698e03905c8bf0fff4889b3028975e832a5f801a9c82008b612"

      def install
        bin.install "pass-cli-linux-x86_64" => "pass-cli"
      end
    end

    on_arm do
      url "https://proton.me/download/pass-cli/2.7.1/pass-cli-linux-aarch64"
      sha256 "43616b8c38b44dae702679b376726889a1f9dc767cf86932b29b03d89a93b283"

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
