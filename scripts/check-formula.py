"""Check release coordinates; --download verifies the published asset bytes."""
import argparse
import hashlib
import re
import urllib.request
from pathlib import Path


def release_assets(source):
    version = re.search(r'^  version "([0-9]+\.[0-9]+\.[0-9]+)"$', source, re.M)
    if not version:
        raise ValueError('Formula must declare one semantic release version')
    assets = re.findall(r'url "([^"]+)"\s+sha256 "([0-9a-f]{64})"', source)
    prefix = f'https://github.com/GetBrew/brew-cli/releases/download/v{version[1]}/brew-cli-'
    expected = {'darwin-arm64', 'darwin-x64', 'linux-arm64', 'linux-x64'}
    if len(assets) != 4 or {url.removeprefix(prefix) for url, _ in assets} != expected:
        raise ValueError('Formula assets must match its version and all four supported targets')
    return assets


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--download', action='store_true')
    args = parser.parse_args()
    source = (Path(__file__).resolve().parents[1] / 'Formula/brew-cli.rb').read_text()
    assets = release_assets(source)
    if args.download:
        for url, expected in assets:
            digest = hashlib.sha256()
            with urllib.request.urlopen(url, timeout=120) as response:
                while chunk := response.read(1024 * 1024):
                    digest.update(chunk)
            if digest.hexdigest() != expected:
                raise ValueError(f'Release checksum mismatch: {url}')
            print(f'Checksum verified: {url.rsplit("/", 1)[1]}')
    print('Formula release coordinates are valid.')


if __name__ == '__main__':
    main()
