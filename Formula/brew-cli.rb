class BrewCli < Formula
  desc "Official agent-first CLI for the Brew public API"
  homepage "https://github.com/GetBrew/brew-cli"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/GetBrew/brew-cli/releases/download/v0.3.0/brew-cli-darwin-arm64"
      sha256 "d8e7e127dc8c153d02820e4772b1d1fe0662f9252ff1db212e5902f2202770a4"
    else
      url "https://github.com/GetBrew/brew-cli/releases/download/v0.3.0/brew-cli-darwin-x64"
      sha256 "55acd354d2561e71942dae498996869357d7a37221ad2e7a289f0471aa8faa19"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/GetBrew/brew-cli/releases/download/v0.3.0/brew-cli-linux-arm64"
      sha256 "070f79ef8101a8239841f70b7d5e080f9e5fc41d5141b9055160b87a3ecac067"
    else
      url "https://github.com/GetBrew/brew-cli/releases/download/v0.3.0/brew-cli-linux-x64"
      sha256 "21ed82faa6af2d6acdeefe970d73932384c9a95da02bb7fd718f61b5de4e55a5"
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
