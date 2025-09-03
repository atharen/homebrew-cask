cask "eigenwallet@beta" do
  # Monero wallet with trustless cross-chain XMR<>BTC Atomic Swaps
  # Previously known as UnstoppableSwap
  # SHA256 checksums from GitHub release assets
  arch arm: "aarch64", intel: "x64"

  version "3.0.0-beta.11"
  sha256 arm:   "c494c9289768445624ad9dcd292e52c58cb6949d2912da3a080ea053eb5dfcf9",
         intel: "1cd150616ba06f66e24a852b29ef198e105915c4f3f8a3e623cf3a76147bb6dc"

  url "https://github.com/eigenwallet/core/releases/download/#{version}/eigenwallet_#{version}_#{arch}.dmg",
      verified: "github.com/eigenwallet/core/"
  name "Eigenwallet"
  desc "Monero wallet with trustless cross-chain XMR<>BTC Atomic Swaps"
  homepage "https://eigenwallet.org/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :catalina"

  app "Eigenwallet.app"

  zap trash: [
    "~/Library/Application Support/eigenwallet",
  ]

  caveats do
    <<~EOS
      SHA256 checksums verified from GitHub release assets.
      For additional verification, see: https://eigenwallet.org/download.html
    EOS
  end
end
