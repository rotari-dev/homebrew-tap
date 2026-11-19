class Rotari < Formula
  desc "Serverless workflow engine for repeatable shell-command jobs"
  homepage "https://github.com/rotari-dev/rotari"
  url "https://github.com/rotari-dev/rotari/archive/refs/tags/v0.1.32.tar.gz"
  sha256 "5e60334543d49c5863a2f09525fb87092aac4d824c7ed35c8fc9ce7ce3173271"
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
