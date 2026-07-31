class PassCli < Formula
  desc "Proton Pass CLI - Command-line interface for Proton Pass"
  homepage "https://proton.me/pass"
  version "2.2.4"
  license "GPL-3.0"

  on_macos do
    on_intel do
      url "https://proton.me/download/pass-cli/2.2.4/pass-cli-macos-x86_64"
      sha256 "0b64a761236b930d6c938d7571ac4e3a8f5a32e144aee52b75a604e8998bf0bf"

      def install
        bin.install "pass-cli-macos-x86_64" => "pass-cli"
      end
    end

    on_arm do
      url "https://proton.me/download/pass-cli/2.2.4/pass-cli-macos-aarch64"
      sha256 "0ed5dcc0256969ea7438f90530edef2c960dc1f06d0a5ea39d56a3e1c3125924"

      def install
        bin.install "pass-cli-macos-aarch64" => "pass-cli"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://proton.me/download/pass-cli/2.2.4/pass-cli-linux-x86_64"
      sha256 "9d50cb8604e3c7aee0bdd29fcecf4696ed3259134a6c17e4b8adadfde17d7bb6"

      def install
        bin.install "pass-cli-linux-x86_64" => "pass-cli"
      end
    end

    on_arm do
      url "https://proton.me/download/pass-cli/2.2.4/pass-cli-linux-aarch64"
      sha256 "6aa8a9933749c19608a73658369b8133441b6ffed3e83ac6cf3f32b9851b9fa6"

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
