class PassCli < Formula
  desc "Proton Pass CLI - Command-line interface for Proton Pass"
  homepage "https://proton.me/pass"
  version "2.3.2"
  license "GPL-3.0"

  on_macos do
    on_intel do
      url "https://proton.me/download/pass-cli/2.3.2/pass-cli-macos-x86_64"
      sha256 "caf900b08a0e9d321a1e27b6979422cbaf65cf333481899aacba5155da34bf2a"

      def install
        bin.install "pass-cli-macos-x86_64" => "pass-cli"
      end
    end

    on_arm do
      url "https://proton.me/download/pass-cli/2.3.2/pass-cli-macos-aarch64"
      sha256 "fbf89ead5bfb2866d999d6870e63a7996deb83f510021943a160b0630e516c42"

      def install
        bin.install "pass-cli-macos-aarch64" => "pass-cli"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://proton.me/download/pass-cli/2.3.2/pass-cli-linux-x86_64"
      sha256 "f95c6b39b45d96b670f249ccbb56b06b3a17d4579357d2d04c4ac64e4ffbeff7"

      def install
        bin.install "pass-cli-linux-x86_64" => "pass-cli"
      end
    end

    on_arm do
      url "https://proton.me/download/pass-cli/2.3.2/pass-cli-linux-aarch64"
      sha256 "b601334cc78f4ddb125708c6d64b8b509e5a82a337bb8bead0bc2f86dd9cabff"

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
