cask "proton-pass-cli" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "macos", linux: "linux"

  version "1.8.0"
  sha256 arm:          "ea4158edc2cdff109ecf869ea6b5781e594fc714c40a25768c8e3be62cecac8f",
         intel:        "7fc3f43efe035093e5705e2a3e6aa52c41c57d16242ebc663c881a9141586659",
         arm64_linux:  "b7703238b17499787d782c413a1ddef163c13e8c2ff69599d9641309397e4ad0",
         x86_64_linux: "33bcd6c556071e333cebf9772bed0047c41c7a2c9d3f49f4b178fdad272d69e2"

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
