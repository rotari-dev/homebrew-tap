class Rotari < Formula
  desc "Serverless workflow engine for repeatable shell-command jobs"
  homepage "https://github.com/rotari-dev/rotari"
  url "https://github.com/rotari-dev/rotari/archive/refs/tags/v0.1.24.tar.gz"
  sha256 "e70341b63a41127eff9a78d3863123a972aad4468e6d89cf16a20b18dfb03dec"
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
