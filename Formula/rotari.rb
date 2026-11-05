class Rotari < Formula
  desc "Serverless workflow engine for repeatable shell-command jobs"
  homepage "https://github.com/rotari-dev/rotari"
  url "https://github.com/rotari-dev/rotari/archive/refs/tags/v0.1.26.tar.gz"
  sha256 "5c0c6de2d4dbb785c606e1984c12578d13ff37a7e11c61a67408ec77bfd70b11"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", "-trimpath",
           "-ldflags", "-s -w -X main.version=#{version}",
           "-o", bin/"rotari", "./cmd/rotari"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rotari version")
  end
end
