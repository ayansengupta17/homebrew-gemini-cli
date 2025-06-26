require "language/node"

class GeminiCli < Formula
  desc "Command-line tool to interact with Google Gemini"
  homepage "https://github.com/google-gemini/gemini-cli"
  url "https://github.com/google-gemini/gemini-cli/archive/refs/tags/early-access.tar.gz"
  version "0.1.5"
  sha256 "293fee028f05fd2278a1acd2b593537edd4b7d84b956df12b37bd5a60a8955c3"
  license "MIT"

  depends_on "node"

  keg_only :versioned_formula

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    system "npm", "run", "bundle"
    bin.install_symlink libexec/"bundle/gemini.js" => "gemini"
  end

  livecheck do
    url :stable
    strategy :github_latest
  end

  test do
    assert_match "Options:", shell_output("#{bin}/gemini --help")
  end
end