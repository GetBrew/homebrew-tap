class BrewCli < Formula
  desc "Official agent-first CLI for the Brew public API"
  homepage "https://github.com/GetBrew/brew-cli"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/GetBrew/brew-cli/releases/download/v0.4.0/brew-cli-darwin-arm64"
      sha256 "53e4c553e3c04f21b9a96fe2f9022cc97ab0ae570229cd7ce8e4a53343ee7e83"
    else
      url "https://github.com/GetBrew/brew-cli/releases/download/v0.4.0/brew-cli-darwin-x64"
      sha256 "eca393f14e06ac68faa54951952102d98b7aa5796576899c86821be65f099bfa"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/GetBrew/brew-cli/releases/download/v0.4.0/brew-cli-linux-arm64"
      sha256 "c77da1bddcc3ebce6393007cb8001d8f3e7cd28c4b6360b1139b238db457c7f8"
    else
      url "https://github.com/GetBrew/brew-cli/releases/download/v0.4.0/brew-cli-linux-x64"
      sha256 "794e7406f2aec981281263a75f1357fdc1a1eaba57eefa2cfc22fcb735eaf5af"
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
