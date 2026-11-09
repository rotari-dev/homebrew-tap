class Rotari < Formula
  desc "Serverless workflow engine for repeatable shell-command jobs"
  homepage "https://github.com/rotari-dev/rotari"
  url "https://github.com/rotari-dev/rotari/archive/refs/tags/v0.1.28.tar.gz"
  sha256 "3b522a95f45e849dbdd8b635b9bd17af90f3ebe9512d9a317ae5dac11f1ce4ea"
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
