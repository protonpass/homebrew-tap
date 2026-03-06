cask "proton-pass-cli" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "macos", linux: "linux"

  version "1.5.2"
  sha256 arm:          "f24eacb50155502f2f9b2b5857fcd4251b09c554679b67857aa97b1d37c2b2e7",
         intel:        "cfb2c07f0fc9d8fecd4b2508af4bb0f20ee9ca54a4174123517d4c173b899889",
         arm64_linux:  "ac88e2ebf15a4799c508408c0cf81dd9180313fe45b67941567ebd30c4fbadb2",
         x86_64_linux: "b6e02ac79cee277767023dda21b6cea276d56fdb0bf85d96eaf022ff6227debc"

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
