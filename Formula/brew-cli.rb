class BrewCli < Formula
  desc "Official agent-first CLI for the Brew public API"
  homepage "https://github.com/GetBrew/brew-cli"
  version "0.17.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/GetBrew/brew-cli/releases/download/v0.17.0/brew-cli-darwin-arm64"
      sha256 "3721979737c5bdb7703592c639e83957da4d56b932cfd2b720eda08a813c5bb5"
    else
      url "https://github.com/GetBrew/brew-cli/releases/download/v0.17.0/brew-cli-darwin-x64"
      sha256 "a654428c31c61cdc3d56e2075524646a1eb931eadfc6ddf320d990d1934f08b3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/GetBrew/brew-cli/releases/download/v0.17.0/brew-cli-linux-arm64"
      sha256 "f0cddc5c351ed97f1d91c6b63ecd62c1aef926f71814236cdb77119e554ff2ce"
    else
      url "https://github.com/GetBrew/brew-cli/releases/download/v0.17.0/brew-cli-linux-x64"
      sha256 "418ef408c05ef42f3372a29d55db6f3fb1eb2f7724dee6e59ede7add83788030"
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
