class BrewCli < Formula
  desc "Official agent-first CLI for the Brew public API"
  homepage "https://github.com/GetBrew/brew-cli"
  version "0.18.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/GetBrew/brew-cli/releases/download/v0.18.1/brew-cli-darwin-arm64"
      sha256 "735316bd3df640caf8cad5aeac53cc1e0defdcd4a7f1a80e5309c96ee7c74392"
    else
      url "https://github.com/GetBrew/brew-cli/releases/download/v0.18.1/brew-cli-darwin-x64"
      sha256 "7ee54c92044dceae9a8ee698cacd51c250cecb21c9916cc63389519119506f82"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/GetBrew/brew-cli/releases/download/v0.18.1/brew-cli-linux-arm64"
      sha256 "170649b638fd7954f5650aa39b4c9982ebf41dbd4a05ce702cb2b39bd133f4af"
    else
      url "https://github.com/GetBrew/brew-cli/releases/download/v0.18.1/brew-cli-linux-x64"
      sha256 "2378acbbabfbb4439229b960fd7ec43f458cc5fb618007be89bcd4dd1794df8d"
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
