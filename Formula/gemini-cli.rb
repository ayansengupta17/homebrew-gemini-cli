require "language/node"

class GeminiCli < Formula
  desc "A command-line AI workflow tool that connects to your tools, understands your code and accelerates your workflows."
  homepage "https://github.com/google-gemini/gemini-cli"
  url "https://github.com/google-gemini/gemini-cli/archive/refs/tags/early-access.tar.gz"
  version "0.1.5"
  sha256 "293fee028f05fd2278a1acd2b593537edd4b7d84b956df12b37bd5a60a8955c3"
  license "MIT"

  depends_on "node"

  def install
    # Install dependencies
    system "npm", "install"
    # Build the executable
    system "npm", "run", "bundle"
    # Install all files
    libexec.install Dir["*"]
    # Create the symlink
    bin.install_symlink "#{libexec}/bundle/gemini.js" => "gemini"
  end

  test do
    assert_match "Options:", shell_output("#{bin}/gemini --help")
  end
end
