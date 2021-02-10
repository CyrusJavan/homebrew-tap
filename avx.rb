class Avx < Formula
  desc "A simple CLI for the Aviatrix API."
  homepage "https://github.com/CyrusJavan/avx"
  url "https://github.com/CyrusJavan/avx/archive/v0.0.1-alpha.4.tar.gz"
  sha256 "409af29b43277bac0e95700ae07e965056ba656b"

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
