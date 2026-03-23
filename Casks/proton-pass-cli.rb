cask "proton-pass-cli" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "macos", linux: "linux"

  version "1.7.0"
  sha256 arm:          "7c831780283bc1529641b04f685fb64a03252393b796bfbfe62e0e8c2426595e",
         intel:        "f3f16f1a05bd998fd2b1b044eac6ff173652189e8596dd83c0df7a7b1df0bb7d",
         arm64_linux:  "42f005b058659423c9246a7434b8635dfe33355336b6413921870d0f9bf84e85",
         x86_64_linux: "ad5ffce3200d9f68e660a41d2474c4b6bca5b170521034e74c0ef975924b188a"

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
