cask "proton-pass-cli" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "macos", linux: "linux"

  version "1.4.3"
  sha256 arm:          "8f546f59f17ef396a6eb8d75d159d7972ab9d9a3dcfc19e53d3c35a3f0907a95",
         intel:        "0899b82e847a1f7ef38d6f8be9cd16f9ac2478e85fe49361cd1ecc7c0c591fd2",
         arm64_linux:  "445de4dc53eadd32fb6e98d3c639d050de8f7bc097accf89e8d4d8efc8c13b7a",
         x86_64_linux: "ac3308ec4c7cc9ce70dc72b2441e0a8cddf17dea147c5b4108bc8fbd2afeba08"

  url "https://proton.me/download/pass-cli/#{version}/pass-cli-#{os}-#{arch}",
      verified: "proton.me/download/pass-cli/"
  name "Proton Pass CLI"
  desc "Command-line interface for Proton Pass"
  homepage "https://protonpass.github.io/pass-cli/"

  livecheck do
    url "https://github.com/protonpass/pass-cli.git"
    strategy :git do |tags|
      tags.filter_map { |tag| tag[/^v?(\d+(?:\.\d+)+)$/, 1] }
    end
  end

  binary "pass-cli-#{os}-#{arch}", target: "pass-cli"

  zap trash: [
    "~/.local/share/proton-pass-cli",
    "~/Library/Application Support/proton-pass-cli",
  ]

  caveats <<~EOS
    The Proton Pass CLI has been installed as `pass-cli`.

    To get started:
      pass-cli login
  EOS
end
