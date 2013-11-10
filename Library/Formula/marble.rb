require 'formula'

class Marble < Formula
  homepage 'http://marble.kde.org/'
  url 'http://download.kde.org/stable/4.11.3/src/marble-4.11.3.tar.xz'
  sha1 'b0b0cf06b4c60262861e748c6815d62513df13a7'

  depends_on 'cmake' => :build
  depends_on 'qt'

  def install
    system "cmake", "-DQTONLY=ON", ".", *std_cmake_args
    system "make", "install"
  end

  def caveats; <<-EOS.undent
    Marble.app was installed in:
      #{prefix}

    To symlink into ~/Applications, run:
      brew linkapps
    EOS
  end
end
