class PassCli < Formula
  desc "Proton Pass CLI - Command-line interface for Proton Pass"
  homepage "https://proton.me/pass"
  version "2.2.2"
  license "GPL-3.0"

  on_macos do
    on_intel do
      url "https://proton.me/download/pass-cli/2.2.2/pass-cli-macos-x86_64"
      sha256 "1af7a4e5eab3d526a1e47c38925c62412412016dcb3ae10fbc55105265e5c153"

      def install
        bin.install "pass-cli-macos-x86_64" => "pass-cli"
      end
    end

    on_arm do
      url "https://proton.me/download/pass-cli/2.2.2/pass-cli-macos-aarch64"
      sha256 "09d636a184fb8dc93cd6575fe913451ec46539c745ba48d533fd9fab44c740f3"

      def install
        bin.install "pass-cli-macos-aarch64" => "pass-cli"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://proton.me/download/pass-cli/2.2.2/pass-cli-linux-x86_64"
      sha256 "65bf75195bfd0fe8d9660144c837466b7ee9195d38e56e3557d5ee6439c5f751"

      def install
        bin.install "pass-cli-linux-x86_64" => "pass-cli"
      end
    end

    on_arm do
      url "https://proton.me/download/pass-cli/2.2.2/pass-cli-linux-aarch64"
      sha256 "a158db185805df030f25961f8947d991108bcd6f901afe3892b8ff1d40021961"

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
