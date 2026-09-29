class BrewCli < Formula
  desc "Official agent-first CLI for the Brew public API"
  homepage "https://github.com/GetBrew/brew-cli"
  version "0.10.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/GetBrew/brew-cli/releases/download/v0.10.0/brew-cli-darwin-arm64"
      sha256 "0c64eb44c930ab1432176194c3b5c79aa09168624729765c14260720053872ee"
    else
      url "https://github.com/GetBrew/brew-cli/releases/download/v0.10.0/brew-cli-darwin-x64"
      sha256 "c3d081c7e0b42c9ad0c3c8b987d1616e7cc7f663075d0436df93c0641d69c197"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/GetBrew/brew-cli/releases/download/v0.10.0/brew-cli-linux-arm64"
      sha256 "c137083ab0562df8f49a9c4d5a6531357515ce51fc1fd6f4a6231e24211c2840"
    else
      url "https://github.com/GetBrew/brew-cli/releases/download/v0.10.0/brew-cli-linux-x64"
      sha256 "c98d2727cd85f4045ab478e7d0e5deac7e85496f88fa520455a725887f321d30"
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
