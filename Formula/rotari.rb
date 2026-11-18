class Rotari < Formula
  desc "Serverless workflow engine for repeatable shell-command jobs"
  homepage "https://github.com/rotari-dev/rotari"
  url "https://github.com/rotari-dev/rotari/archive/refs/tags/v0.1.31.tar.gz"
  sha256 "7c865a69a80c1b4c097382f241e17b6ec1c3f77c9db170e371e7299f2521ca16"
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
