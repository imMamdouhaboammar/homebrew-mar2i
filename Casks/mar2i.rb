cask "mar2i" do
  arch arm: "aarch64", intel: "x64"

  version "0.2.5"
  sha256 arm:   "e77f89df8ff7c5935342d593da49344aa2a31618ba7a708d9e81581e91195d3b",
         intel: "e77f89df8ff7c5935342d593da49344aa2a31618ba7a708d9e81581e91195d3b"

  url "https://github.com/imMamdouhaboammar/mar2i/releases/download/v#{version}/Mar2i_#{version}_#{arch}.dmg",
      verified: "github.com/imMamdouhaboammar/mar2i/"
  name "Mar2i"
  name "مرئي"
  desc "Offline bulk video compression and archival desktop application"
  homepage "https://github.com/imMamdouhaboammar/mar2i"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Mar2i.app"

  zap trash: [
    "~/Library/Application Support/com.mamdouh.mar2i",
    "~/Library/Caches/com.mamdouh.mar2i",
    "~/Library/Preferences/com.mamdouh.mar2i.plist",
    "~/Library/Saved Application State/com.mamdouh.mar2i.savedState",
    "~/Library/WebKit/com.mamdouh.mar2i",
  ]

  caveats <<~EOS
    Mar2i is distributed with ad-hoc signing. To bypass macOS Gatekeeper
    quarantine verification during Homebrew installation, use:

      brew install --cask --no-quarantine imMamdouhaboammar/mar2i/mar2i

    If you installed without --no-quarantine and macOS prevents the app from opening,
    remove the quarantine attribute manually by running:

      xattr -cr /Applications/Mar2i.app
  EOS
end
