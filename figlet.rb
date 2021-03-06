require 'formula'

class Figlet < Formula
  homepage 'http://www.figlet.org'
  mirror 'http://www.spacebison.com/files/figlet-2.2.5.tar.gz'
  url 'ftp://ftp.figlet.org/pub/figlet/program/unix/figlet-2.2.5.tar.gz'
  sha1 'dda696958c161bd71d6590152c94c4f705415727'

  resource 'contrib' do
    url 'ftp://ftp.figlet.org/pub/figlet/fonts/contributed.tar.gz'
    sha1 'a23ecfdb54301e93b6578c3c465ba84c8f861d4f'
  end

  resource 'intl' do
    url 'ftp://ftp.figlet.org/pub/figlet/fonts/international.tar.gz'
    sha1 '4bdc505f82305debf8108b725ac418f404a8bcb0'
  end

  def install
    share_fonts = share+"figlet/fonts"
    share_fonts.install resource('contrib'), resource('intl')

    chmod 0666, %w(Makefile showfigfonts)
    man6.mkpath
    bin.mkpath

    system "make", "prefix=#{prefix}",
                   "DEFAULTFONTDIR=#{share_fonts}",
                   "MANDIR=#{man}",
                   "install"
  end

  def test
    system "#{bin}/figlet", "-f", "larry3d", "hello, figlet"
  end
end
