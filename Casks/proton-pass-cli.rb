cask "proton-pass-cli" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "macos", linux: "linux"

  version "2.0.1"
  sha256 arm:          "21e98711d4496040edbdd873f1d82ac74c07af43be4fe1abfde60f905c7fe1df",
         intel:        "15d9f0a29c803aae5070786a92f690adebb76feb7b8dbc82bccad79be79532fa",
         arm64_linux:  "ec125e4f8fbfc8924d4d146c08a684c6f1188de9f7402d16ceefebf3c9e1727e",
         x86_64_linux: "e41cfea8d324c47184303059610d75bc2631d75054300cf45c35405a16f3d7f3"

  url "https://proton.me/download/pass-cli/#{version}/pass-cli-#{os}-#{arch}",
      verified: "proton.me/"
  name "Proton Pass CLI"
  desc "Command-line interface for Proton Pass"
  homepage "https://protonpass.github.io/pass-cli/"

  livecheck do
    url "https://proton.me/download/pass-cli/versions.json"
    strategy :json do |json|
      json["passCliVersions"]["version"]
    end
  end

  binary "pass-cli-#{os}-#{arch}", target: "pass-cli"

  caveats <<~EOS
    The Proton Pass CLI has been installed as 'pass-cli'.

    To get started:
      pass-cli login

    For help:
      pass-cli --help

    Documentation: https://protonpass.github.io/pass-cli/
  EOS

  zap trash: [
    "~/.local/share/proton-pass-cli",
    "~/.ssh/proton-pass-agent.*",
    "~/Library/Application Support/proton-pass-cli",
  ]
end
