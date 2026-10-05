class BrewCli < Formula
  desc "Official agent-first CLI for the Brew public API"
  homepage "https://github.com/GetBrew/brew-cli"
  version "0.15.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/GetBrew/brew-cli/releases/download/v0.15.0/brew-cli-darwin-arm64"
      sha256 "15c140dbfd9b4fca52804a93c933a8450e4e65dcc90e94b7e6c222d32fa1e6c9"
    else
      url "https://github.com/GetBrew/brew-cli/releases/download/v0.15.0/brew-cli-darwin-x64"
      sha256 "d45708f1c13b6cced794b19e95d03d125daa3344cab55b1cb45010b488be9cf5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/GetBrew/brew-cli/releases/download/v0.15.0/brew-cli-linux-arm64"
      sha256 "ae9a1f97ab9adc57c9d036a67e37b492ecc842b0cb90ad3fa18b7d0a440913ff"
    else
      url "https://github.com/GetBrew/brew-cli/releases/download/v0.15.0/brew-cli-linux-x64"
      sha256 "ea8ed40496afc714b87e6c09e9f33b5710f4dac34cc2471625c5a2a9c8afdb0b"
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
