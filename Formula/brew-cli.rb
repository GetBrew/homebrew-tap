class BrewCli < Formula
  desc "Official agent-first CLI for the Brew public API"
  homepage "https://github.com/GetBrew/brew-cli"
  version "0.13.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/GetBrew/brew-cli/releases/download/v0.13.0/brew-cli-darwin-arm64"
      sha256 "6ef6e55dcd7e09f89fbc3d4d49f6608e04178d3737bd9ee6c4728e6e599b5234"
    else
      url "https://github.com/GetBrew/brew-cli/releases/download/v0.13.0/brew-cli-darwin-x64"
      sha256 "66f28fae5ce52f5883e84be42a327952bf1c12bdac9eaa80df6c18180db21d36"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/GetBrew/brew-cli/releases/download/v0.13.0/brew-cli-linux-arm64"
      sha256 "28d12ccd4b7b7b339d68b8b7b8814c8b3ff035ac46e562688ebc1a2f4b73481f"
    else
      url "https://github.com/GetBrew/brew-cli/releases/download/v0.13.0/brew-cli-linux-x64"
      sha256 "34bfcfc242f3c06da33ea7ed417aa288d2988d47bde58eb2a0f4f274254ef9d9"
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
