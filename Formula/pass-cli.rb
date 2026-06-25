class PassCli < Formula
  desc "Proton Pass CLI - Command-line interface for Proton Pass"
  homepage "https://proton.me/pass"
  version "2.2.0"
  license "GPL-3.0"

  on_macos do
    on_intel do
      url "https://proton.me/download/pass-cli/2.2.0/pass-cli-macos-x86_64"
      sha256 "47dc9e7dc62e41013ad48b4e9d1057820e038d8e3b53a98aa73da40d2a489662"

      def install
        bin.install "pass-cli-macos-x86_64" => "pass-cli"
      end
    end

    on_arm do
      url "https://proton.me/download/pass-cli/2.2.0/pass-cli-macos-aarch64"
      sha256 "32deb67778b27ec6cbadf67069f6e60202dcad8f97b14bcd151d81a0f063c69a"

      def install
        bin.install "pass-cli-macos-aarch64" => "pass-cli"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://proton.me/download/pass-cli/2.2.0/pass-cli-linux-x86_64"
      sha256 "b880b43bb618c6e3711a41f0652078ab6030205452b988d8f075b71d49445735"

      def install
        bin.install "pass-cli-linux-x86_64" => "pass-cli"
      end
    end

    on_arm do
      url "https://proton.me/download/pass-cli/2.2.0/pass-cli-linux-aarch64"
      sha256 "ec4082d8df4c9e2455c1faf8018fba7fc90d8572217377851d9596e1918f634b"

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
