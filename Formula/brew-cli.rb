class BrewCli < Formula
  desc "Official agent-first CLI for the Brew public API"
  homepage "https://github.com/GetBrew/brew-cli"
  version "0.19.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/GetBrew/brew-cli/releases/download/v0.19.0/brew-cli-darwin-arm64"
      sha256 "37a9bdef047b513541a746c9166d5b774a9e0d2a6d369051bc2e0b3bba304a0d"
    else
      url "https://github.com/GetBrew/brew-cli/releases/download/v0.19.0/brew-cli-darwin-x64"
      sha256 "e265b2547d607284551c97d33a10dd670b830571fb55e6c3c8e3907bbf33e4ac"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/GetBrew/brew-cli/releases/download/v0.19.0/brew-cli-linux-arm64"
      sha256 "2897581f6f0f00045f960eaf1ca6904f0e109b1e65a497ae4073946cf586877f"
    else
      url "https://github.com/GetBrew/brew-cli/releases/download/v0.19.0/brew-cli-linux-x64"
      sha256 "00f09a7be3810b33c2d94a91f7155c680cd283f2f2c30cfa134daa52913cfd54"
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
