class Wiggle < Formula
  desc "Program for applying patches with conflicting changes"
  homepage "https://github.com/neilbrown/wiggle"
  url "https://github.com/neilbrown/wiggle/archive/refs/tags/v1.3.tar.gz"
  sha256 "ff92cf0133c1f4dce33563e263cb30e7ddb6f4abdf86d427b1ec1490bec25afa"
  license "GPL-2.0-or-later"

  livecheck do
    url "https://neil.brown.name/wiggle/"
    regex(/href=.*?wiggle[._-](\d+(?:\.\d+)+)\.t/i)
  end

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_monterey: "2340430acf70ad6cff33fb034eda572c80f359b3847b90ebcce1c732cc2bb792"
    sha256 cellar: :any_skip_relocation, arm64_big_sur:  "f585911f982b406255e79f0c3b6a4a71b7e438b0d102f1d9c39d1fdb806fe40e"
    sha256 cellar: :any_skip_relocation, monterey:       "6ef8230cd01f245db7718475da9c898919bc52b9729b2a603e797dce13d796fc"
    sha256 cellar: :any_skip_relocation, big_sur:        "233a538ebdde21f7038aafd73fb4a20afb0dbb6715f54f4fc305ad7ca4966672"
    sha256 cellar: :any_skip_relocation, catalina:       "e50353191b0368db9dd898d730b74ea3612c1cff728717fc8b5904a6d44e2015"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "e9181d60a846d40b7850bb1647b1dcfba43a56f46d26bda4965df7e6f9857900"
  end

  uses_from_macos "groff" => :build
  uses_from_macos "ncurses"

  def install
    system "make", "OptDbg=#{ENV.cflags}", "wiggle", "wiggle.man", "test"
    bin.install "wiggle"
    man1.install "wiggle.1"
  end

  test do
    system "#{bin}/wiggle", "--version"
  end
end
