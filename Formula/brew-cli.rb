class BrewCli < Formula
  desc "Official agent-first CLI for the Brew public API"
  homepage "https://github.com/GetBrew/brew-cli"
  version "0.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/GetBrew/brew-cli/releases/download/v0.6.0/brew-cli-darwin-arm64"
      sha256 "cc610fdd18d018dc10b13489c825391d7b7ca0b74a227b92223f341edd99eaa7"
    else
      url "https://github.com/GetBrew/brew-cli/releases/download/v0.6.0/brew-cli-darwin-x64"
      sha256 "3099af7244be9da497921aba3b3b1e7aca91492015e622623d36cc165b4226df"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/GetBrew/brew-cli/releases/download/v0.6.0/brew-cli-linux-arm64"
      sha256 "69e14173044f57171f19fb18656e581f55da9f09ae406d3c0d0accaa2e6d8a24"
    else
      url "https://github.com/GetBrew/brew-cli/releases/download/v0.6.0/brew-cli-linux-x64"
      sha256 "bcbbc42dccf39d9ef11c8d3d1443a2f81f16ce51f20d3478932fac7976be8832"
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
