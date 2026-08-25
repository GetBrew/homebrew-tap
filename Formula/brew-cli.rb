class BrewCli < Formula
  desc "Official agent-first CLI for the Brew public API"
  homepage "https://github.com/GetBrew/brew-cli"
  version "0.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/GetBrew/brew-cli/releases/download/v0.5.0/brew-cli-darwin-arm64"
      sha256 "f42ac4e92054cc6e1bbbfada7c1ad10ab9b986f76d3baef8cc895a4c1d2fae3a"
    else
      url "https://github.com/GetBrew/brew-cli/releases/download/v0.5.0/brew-cli-darwin-x64"
      sha256 "7b37bbcdd9a7b26544a4a2801a19e60d235c5bb6f98a610b4a9b253a19a177bb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/GetBrew/brew-cli/releases/download/v0.5.0/brew-cli-linux-arm64"
      sha256 "ec04de359c710e4cd7770f0b0aa200675139e5f123cfa52df64b31d8fc1adcf6"
    else
      url "https://github.com/GetBrew/brew-cli/releases/download/v0.5.0/brew-cli-linux-x64"
      sha256 "38d89d48feae979d55362209fe4fb06f344c607cf07fd4534774e5e95d4e6aca"
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
