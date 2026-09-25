class BrewCli < Formula
  desc "Official agent-first CLI for the Brew public API"
  homepage "https://github.com/GetBrew/brew-cli"
  version "0.8.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/GetBrew/brew-cli/releases/download/v0.8.0/brew-cli-darwin-arm64"
      sha256 "6757a35ae276059271db34c9ee9edfdc6e19ebfc3e3d410678fbf4e4965df856"
    else
      url "https://github.com/GetBrew/brew-cli/releases/download/v0.8.0/brew-cli-darwin-x64"
      sha256 "4c9b5daa71edca1fda3ac59e59844274fb2804c7d3a370ef0e1f2e04692d262f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/GetBrew/brew-cli/releases/download/v0.8.0/brew-cli-linux-arm64"
      sha256 "b38de903a9b160530170bc22fc478fedcc12a0732f3af16fc93829ea9a0c98a9"
    else
      url "https://github.com/GetBrew/brew-cli/releases/download/v0.8.0/brew-cli-linux-x64"
      sha256 "6e99ea99048b2cf61c1b1822f86247332b13c709cc3b1a4a14513e608c5bae5f"
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
