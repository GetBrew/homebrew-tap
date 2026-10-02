class BrewCli < Formula
  desc "Official agent-first CLI for the Brew public API"
  homepage "https://github.com/GetBrew/brew-cli"
  version "0.12.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/GetBrew/brew-cli/releases/download/v0.12.0/brew-cli-darwin-arm64"
      sha256 "314a75905f6dc1e3d6b80ae19b04dc4685c6995eea34cc9f9fbf556c1305868c"
    else
      url "https://github.com/GetBrew/brew-cli/releases/download/v0.12.0/brew-cli-darwin-x64"
      sha256 "15e504657976e95652a5d1870b82f0527b8c55e2ad011915f659caf1233d2e80"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/GetBrew/brew-cli/releases/download/v0.12.0/brew-cli-linux-arm64"
      sha256 "1f62ab55188c8bb4ee510ff497115d9b97880dac05e2933c0a82270e68eb27e6"
    else
      url "https://github.com/GetBrew/brew-cli/releases/download/v0.12.0/brew-cli-linux-x64"
      sha256 "8b6663c49b62ec694f5b0fb3e9d9f19e8d6a0da92e94d1579ca135eeb8aff82c"
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
