class PassCli < Formula
  desc "Proton Pass CLI - Command-line interface for Proton Pass"
  homepage "https://proton.me/pass"
  version "2.3.1"
  license "GPL-3.0"

  on_macos do
    on_intel do
      url "https://proton.me/download/pass-cli/2.3.1/pass-cli-macos-x86_64"
      sha256 "79044df045ee3372bee1e6cdef63a2dc2a52e37b1646fff3582cacc5bcdb8d61"

      def install
        bin.install "pass-cli-macos-x86_64" => "pass-cli"
      end
    end

    on_arm do
      url "https://proton.me/download/pass-cli/2.3.1/pass-cli-macos-aarch64"
      sha256 "34e45040830290956a34490a23024fb68ebc71691c3316b1517d852097c9a08c"

      def install
        bin.install "pass-cli-macos-aarch64" => "pass-cli"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://proton.me/download/pass-cli/2.3.1/pass-cli-linux-x86_64"
      sha256 "d16333641219d6c0e0a56799f28bd66d2d8c70a25b21d5123f3ec7a89f32f4cb"

      def install
        bin.install "pass-cli-linux-x86_64" => "pass-cli"
      end
    end

    on_arm do
      url "https://proton.me/download/pass-cli/2.3.1/pass-cli-linux-aarch64"
      sha256 "f04af766b3cb4583fe7b96e87d06d514af62e70101c4f4b834ce886a9ba14c05"

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
