class BrewCli < Formula
  desc "Official agent-first CLI for the Brew public API"
  homepage "https://github.com/GetBrew/brew-cli"
  version "0.14.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/GetBrew/brew-cli/releases/download/v0.14.0/brew-cli-darwin-arm64"
      sha256 "2a1f0c29b9808f85fc76212db0b5793489375c5e8a80f3642770fd0158b97fc8"
    else
      url "https://github.com/GetBrew/brew-cli/releases/download/v0.14.0/brew-cli-darwin-x64"
      sha256 "22b4b76c99dd01feb19dc0a6627d9f3e69874485724e62ec4886075583d1c8a5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/GetBrew/brew-cli/releases/download/v0.14.0/brew-cli-linux-arm64"
      sha256 "0ec3762d52cc35e0ef964ffb47994920503b7c5bf3e04921775eed83ce0da213"
    else
      url "https://github.com/GetBrew/brew-cli/releases/download/v0.14.0/brew-cli-linux-x64"
      sha256 "1bc4bec02afa5af9ab4233b9b2388ac36cc7532d38a1d34bcc3d1a1f98eb9449"
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
