class BrewCli < Formula
  desc "Official agent-first CLI for the Brew public API"
  homepage "https://github.com/GetBrew/brew-cli"
  version "0.9.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/GetBrew/brew-cli/releases/download/v0.9.0/brew-cli-darwin-arm64"
      sha256 "c6b0aa5be31ecf234bea472e2392e7e01aa4a6e851a7382dfe715c34a63027e9"
    else
      url "https://github.com/GetBrew/brew-cli/releases/download/v0.9.0/brew-cli-darwin-x64"
      sha256 "03ff03d45a8ac404fb47235741886cb900860dad3418b756735876bf6b0f5667"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/GetBrew/brew-cli/releases/download/v0.9.0/brew-cli-linux-arm64"
      sha256 "b923f9943d39900872d85ceec5b9153c064270dcf066597b2583afc1991647d4"
    else
      url "https://github.com/GetBrew/brew-cli/releases/download/v0.9.0/brew-cli-linux-x64"
      sha256 "ed48f87d8403fa743e3cbba3011c3ac6a6196bd1d2eae3811833b045733ee412"
    end
  end

  def install
    binary = Dir["brew-cli-*"].first
    bin.install binary => "brew-cli"
  end

  test do
    system "#{bin}/brew-cli", "--version"
  end
end
