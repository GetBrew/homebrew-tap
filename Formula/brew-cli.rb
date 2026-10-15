class BrewCli < Formula
  desc "Official agent-first CLI for the Brew public API"
  homepage "https://github.com/GetBrew/brew-cli"
  version "0.16.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/GetBrew/brew-cli/releases/download/v0.16.0/brew-cli-darwin-arm64"
      sha256 "de22f1a30ba387655f0907b4b22140b6247a07f661b71197baf84ca00d3037b5"
    else
      url "https://github.com/GetBrew/brew-cli/releases/download/v0.16.0/brew-cli-darwin-x64"
      sha256 "e705e60ada0ff05e6db67888fb67a52e618e657ce265bbe0f2b21d5b3f3ed54d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/GetBrew/brew-cli/releases/download/v0.16.0/brew-cli-linux-arm64"
      sha256 "b7311b917568126e57c79924e584f1ab915282d3ca603c2326145e547f8e192d"
    else
      url "https://github.com/GetBrew/brew-cli/releases/download/v0.16.0/brew-cli-linux-x64"
      sha256 "8c8e7d630184ed10faf48aff4849e630faf14a70a1d9d96cdd367b9e4ef97966"
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
