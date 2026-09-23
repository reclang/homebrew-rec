class Reclang < Formula
  desc "Recreational Programming Language compiler"
  homepage "https://github.com/reclang/rec"
  url "https://github.com/reclang/rec/releases/download/v0.0.7/reclang-0.0.7.tar.gz"
  sha256 "2212d586fc57cf7e24d9ef103252c028bad96a7e78ba0434ed18f78fb21ad306"
  license "Apache-2.0" => { with: "LLVM-exception" }

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://ghcr.io/v2/reclang/rec"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "c0226631575c062353057d06226a183c6e4b202febab8afd9a8c59277c2a9458"
    sha256 cellar: :any,                 x86_64_linux: "626b741003391fe54d2520b52151ba83cd419d96b507450f335f1541505dd50e"
  end

  depends_on "ldc" => :build

  def install
    # the D runtime is linked in, so ldc is a build dependency only
    system "make", "install", "PREFIX=#{prefix}",
           "DFLAGS=-O -release -link-defaultlib-shared=false"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/reclang --version").chomp
    (testpath/"hello.rec").write <<~EOS
      void main() {
        writeln("Hello, world!")
        exit(42)
      }
    EOS
    system bin/"reclang", "-o", "hello", "hello.rec"
    assert_equal "Hello, world!\n", shell_output("#{testpath}/hello", 42)
  end
end
