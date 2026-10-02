class BrewCli < Formula
  desc "Official agent-first CLI for the Brew public API"
  homepage "https://github.com/GetBrew/brew-cli"
  version "0.11.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/GetBrew/brew-cli/releases/download/v0.11.0/brew-cli-darwin-arm64"
      sha256 "f8183ad3b9bb216225d145648429984ac63f5324aee8a17d0fde9b17f764a4f8"
    else
      url "https://github.com/GetBrew/brew-cli/releases/download/v0.11.0/brew-cli-darwin-x64"
      sha256 "0df83ccf7c9f809bea3082b18a85ff965dc434369245eaec78e1adacae199907"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/GetBrew/brew-cli/releases/download/v0.11.0/brew-cli-linux-arm64"
      sha256 "19fe5e94ca8b28f1d7898401e187bb5f15fedaec3c242b457ab67a6cf665099f"
    else
      url "https://github.com/GetBrew/brew-cli/releases/download/v0.11.0/brew-cli-linux-x64"
      sha256 "34b7121ff62f7afb1fa89a2c3175395dc988876d3ba50fdfb8a6cdcca0631e25"
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
