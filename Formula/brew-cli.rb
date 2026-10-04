class BrewCli < Formula
  desc "Official agent-first CLI for the Brew public API"
  homepage "https://github.com/GetBrew/brew-cli"
  version "0.13.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/GetBrew/brew-cli/releases/download/v0.13.1/brew-cli-darwin-arm64"
      sha256 "a5b91c63f3f88123d53c3053a2e3d12facd126e83b8bce7044758536681693b7"
    else
      url "https://github.com/GetBrew/brew-cli/releases/download/v0.13.1/brew-cli-darwin-x64"
      sha256 "a5842bde18069c6e5894f2c18a00e2e23b1a56d24b9231d8de5e002ddb6cea74"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/GetBrew/brew-cli/releases/download/v0.13.1/brew-cli-linux-arm64"
      sha256 "608bc71b41198d19d8e2806e1252046a2bcf5450749ed81d73a5556430c8e54b"
    else
      url "https://github.com/GetBrew/brew-cli/releases/download/v0.13.1/brew-cli-linux-x64"
      sha256 "0b607df488570f05f397ec5ac6b26b2ee91017afbef320c2ec452b8339f5b5c8"
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
