class Avx < Formula
  desc "A simple CLI for the Aviatrix API."
  homepage "https://github.com/CyrusJavan/avx"
  url "https://github.com/CyrusJavan/avx/archive/v0.0.1-alpha.4.tar.gz"
  sha256 "b8e80938323c62ba2b972c92c6810ed9531473a27420aa302f441b47d2c316f6"

  depends_on "go"

  def install
    ENV["GOPATH"] = buildpath
    ENV["GO111MODULE"] = "on"
    ENV["GOFLAGS"] = "-mod=vendor"
    ENV["PATH"] = "#{ENV["PATH"]}:#{buildpath}/bin"
    (buildpath/"src/github.com/CyrusJavan/avx").install buildpath.children
    cd "src/github.com/CyrusJavan/avx" do
      system "go", "build", "-o", bin/"avx", "."
    end
  end
end
