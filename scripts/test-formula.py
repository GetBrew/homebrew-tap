import importlib.util
import unittest
from pathlib import Path

spec = importlib.util.spec_from_file_location('formula', Path(__file__).with_name('check-formula.py'))
module = importlib.util.module_from_spec(spec)
spec.loader.exec_module(module)
source = (Path(__file__).resolve().parents[1] / 'Formula/brew-cli.rb').read_text()


class FormulaTests(unittest.TestCase):
    def test_current_coordinates(self):
        self.assertEqual(len(module.release_assets(source)), 4)

    def test_wrong_version_or_missing_checksum_is_rejected(self):
        for bad in [source.replace('/download/v', '/download/v9.'), source.replace('sha256', 'checksum', 1), source.replace('linux-x64', 'darwin-x64')]:
            with self.assertRaises(ValueError):
                module.release_assets(bad)


if __name__ == '__main__':
    unittest.main()
