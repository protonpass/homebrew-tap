cask "proton-pass-cli" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "macos", linux: "linux"

  version "1.10.0"
  sha256 arm:          "b4e1d7265e11dbbaedb9796ca8043c5c5a4e27b3dcd4811c9e56bce4cca7ecdd",
         intel:        "bac98e12b2f905e676b3856b4a1af87d870ee626c105a049ba4de83ed8dff3ce",
         arm64_linux:  "cc941f5a188d93f9e841bae19f1804a861d9c1c72cc95d855f7b043a95064d84",
         x86_64_linux: "9640782394ab8feafea4bbddd8711c87f34f15f1ef8557e0bba442ef287f9e36"

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
end
