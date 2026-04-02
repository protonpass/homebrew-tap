cask "proton-pass-cli" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "macos", linux: "linux"

  version "1.9.0"
  sha256 arm:          "98b62dc3c38dd81f915175640f5d15c88d37777cab770145cfc8220dbfcf88d8",
         intel:        "0bd9d652291f6827eba15c33e02f4af5d34c5293fa91ba47bae1cc453721e5a5",
         arm64_linux:  "760ee3345af3b8879728ddf05779e3f7669cc0fd65a84dd01ecba2a2c8ebbcbc",
         x86_64_linux: "9b71e5957f580266af55b900c89e61ebd402707da2e14c7ea75eded3f546a2f4"

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

  rename "pass-cli-#{os}-#{arch}", "pass-cli"

  binary "pass-cli"

  zap trash: [
    "~/.local/share/proton-pass-cli",
    "~/Library/Application Support/proton-pass-cli",
  ]
end
