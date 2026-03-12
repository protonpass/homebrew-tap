cask "proton-pass-cli" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "macos", linux: "linux"

  version "1.6.1"
  sha256 arm:          "c44a83e444fa6e2d66afd46c716278576b8144dae3cddd3c7c17adf4e0a6dbc2",
         intel:        "cca06b6582c9a58285e71d88de934cb444d6b551fd32acbbee8afb6811b7b008",
         arm64_linux:  "be68a5cbd6faba491d4436e7287472b2c9f76ef44585dcf10f260fa883044acf",
         x86_64_linux: "bbf4ba015b7d37d194cd8481649031ab3c4d5c54cb36db5f7ea2c05b7c8d28bf"

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

  zap trash: [
    "~/.local/share/proton-pass-cli",
    "~/Library/Application Support/proton-pass-cli",
  ]

  caveats "Proton Pass CLI has been installed as `pass-cli`."
end
