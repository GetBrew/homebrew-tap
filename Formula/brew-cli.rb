class BrewCli < Formula
  desc "Official agent-first CLI for the Brew public API"
  homepage "https://github.com/GetBrew/brew-cli"
  version "0.18.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/GetBrew/brew-cli/releases/download/v0.18.0/brew-cli-darwin-arm64"
      sha256 "1d04e33d66f6f7a1471818217364f98c8f3ccaa8acd78f237bd515bd9f9be809"
    else
      url "https://github.com/GetBrew/brew-cli/releases/download/v0.18.0/brew-cli-darwin-x64"
      sha256 "df7f7cbfeb0b9af939538c95408202c4052d68f5b81ee081db525585d6a24c60"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/GetBrew/brew-cli/releases/download/v0.18.0/brew-cli-linux-arm64"
      sha256 "eca2ad9810c3a4d12afacec4a5cceae053e3f9747a823ca1adf78ca56c27cdd3"
    else
      url "https://github.com/GetBrew/brew-cli/releases/download/v0.18.0/brew-cli-linux-x64"
      sha256 "bb928840f3d0f30e3f67b1d71969a9faf5a0f5a3de122bbd1da9a65df1916fd9"
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
