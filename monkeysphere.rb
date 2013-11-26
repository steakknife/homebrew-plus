require 'formula'

class Monkeysphere < Formula
  homepage 'http://web.monkeysphere.info/'
  url 'http://archive.monkeysphere.info/debian/pool/monkeysphere/m/monkeysphere/monkeysphere_0.36.orig.tar.gz'
  sha1 'c4f950346040f7703cb4c6e8b32022f4361d0c9d'

  head 'git://git.monkeysphere.info/monkeysphere'

  depends_on 'Crypt::OpenSSL::Bignum' => :perl
  depends_on 'Crypt::OpenSSL::RSA'    => :perl

  def patches; DATA; end

  def install
    ENV['PREFIX']="#{prefix}"
    ENV['ETCPREFIX']="#{prefix}"
    system "make install"
  end
end

__END__
diff --git a/Makefile b/Makefile
index a37aa8f..36fe1ce 100755
--- a/Makefile
+++ b/Makefile
@@ -45 +45 @@ install: all installman
-	sed -i 's:__SYSSHAREDIR_PREFIX__:$(PREFIX):' $(DESTDIR)$(PREFIX)/bin/monkeysphere
+	sed -i '' 's:__SYSSHAREDIR_PREFIX__:$(PREFIX):' $(DESTDIR)$(PREFIX)/bin/monkeysphere
@@ -47 +47 @@ install: all installman
-	sed -i 's:__SYSSHAREDIR_PREFIX__:$(PREFIX):' $(DESTDIR)$(PREFIX)/sbin/monkeysphere-host
+	sed -i '' 's:__SYSSHAREDIR_PREFIX__:$(PREFIX):' $(DESTDIR)$(PREFIX)/sbin/monkeysphere-host
@@ -49 +49 @@ install: all installman
-	sed -i 's:__SYSSHAREDIR_PREFIX__:$(PREFIX):' $(DESTDIR)$(PREFIX)/sbin/monkeysphere-authentication
+	sed -i '' 's:__SYSSHAREDIR_PREFIX__:$(PREFIX):' $(DESTDIR)$(PREFIX)/sbin/monkeysphere-authentication
@@ -53,2 +53,2 @@ install: all installman
-	sed -i 's:__SYSCONFDIR_PREFIX__:$(ETCPREFIX):' $(DESTDIR)$(PREFIX)/share/monkeysphere/defaultenv
-	sed -i 's:__SYSDATADIR_PREFIX__:$(LOCALSTATEDIR):' $(DESTDIR)$(PREFIX)/share/monkeysphere/defaultenv
+	sed -i '' 's:__SYSCONFDIR_PREFIX__:$(ETCPREFIX):' $(DESTDIR)$(PREFIX)/share/monkeysphere/defaultenv
+	sed -i '' 's:__SYSDATADIR_PREFIX__:$(LOCALSTATEDIR):' $(DESTDIR)$(PREFIX)/share/monkeysphere/defaultenv
@@ -61,2 +61,2 @@ install: all installman
-	sed -i 's:__SYSSHAREDIR_PREFIX__:$(PREFIX):' $(DESTDIR)$(PREFIX)/share/monkeysphere/transitions/0.23
-	sed -i 's:__SYSSHAREDIR_PREFIX__:$(PREFIX):' $(DESTDIR)$(PREFIX)/share/monkeysphere/transitions/0.28
+	sed -i '' 's:__SYSSHAREDIR_PREFIX__:$(PREFIX):' $(DESTDIR)$(PREFIX)/share/monkeysphere/transitions/0.23
+	sed -i '' 's:__SYSSHAREDIR_PREFIX__:$(PREFIX):' $(DESTDIR)$(PREFIX)/share/monkeysphere/transitions/0.28
@@ -83 +83 @@ installman:
-	sed -i 's:__SYSCONFDIR_PREFIX__:$(ETCPREFIX):' $(DESTDIR)$(MANPREFIX)/man1/monkeysphere.1
+	sed -i '' 's:__SYSCONFDIR_PREFIX__:$(ETCPREFIX):' $(DESTDIR)$(MANPREFIX)/man1/monkeysphere.1
@@ -86,2 +86,2 @@ installman:
-	sed -i 's:__SYSCONFDIR_PREFIX__:$(ETCPREFIX):' $(DESTDIR)$(MANPREFIX)/man8/monkeysphere-host.8
-	sed -i 's:__SYSDATADIR_PREFIX__:$(LOCALSTATEDIR):' $(DESTDIR)$(MANPREFIX)/man8/monkeysphere-host.8
+	sed -i '' 's:__SYSCONFDIR_PREFIX__:$(ETCPREFIX):' $(DESTDIR)$(MANPREFIX)/man8/monkeysphere-host.8
+	sed -i '' 's:__SYSDATADIR_PREFIX__:$(LOCALSTATEDIR):' $(DESTDIR)$(MANPREFIX)/man8/monkeysphere-host.8
@@ -90,2 +90,2 @@ installman:
-	sed -i 's:__SYSCONFDIR_PREFIX__:$(ETCPREFIX):' $(DESTDIR)$(MANPREFIX)/man8/monkeysphere-authentication.8
-	sed -i 's:__SYSDATADIR_PREFIX__:$(LOCALSTATEDIR):' $(DESTDIR)$(MANPREFIX)/man8/monkeysphere-authentication.8
+	sed -i '' 's:__SYSCONFDIR_PREFIX__:$(ETCPREFIX):' $(DESTDIR)$(MANPREFIX)/man8/monkeysphere-authentication.8
+	sed -i '' 's:__SYSDATADIR_PREFIX__:$(LOCALSTATEDIR):' $(DESTDIR)$(MANPREFIX)/man8/monkeysphere-authentication.8
diff -ur a/src/openpgp2ssh b/src/openpgp2ssh
--- a/src/openpgp2ssh 2013-10-27 07:02:13.000000000 -0700
+++ b/src/openpgp2ssh 2013-10-27 07:05:10.000000000 -0700
@@ -1,4 +1,4 @@
-#!/usr/bin/perl -T
+#!/usr/bin/env perl

 # keytrans: this is an RSA key translation utility; it is capable of
 # transforming RSA keys (both public keys and secret keys) between
diff -ur a/src/pem2openpgp b/src/pem2openpgp
--- a/src/pem2openpgp 2013-10-27 07:02:13.000000000 -0700
+++ b/src/pem2openpgp 2013-10-27 07:05:10.000000000 -0700
@@ -1,4 +1,4 @@
-#!/usr/bin/perl -T
+#!/usr/bin/env perl

 # keytrans: this is an RSA key translation utility; it is capable of
 # transforming RSA keys (both public keys and secret keys) between
diff -ur a/src/share/checkperms b/src/share/checkperms
--- a/src/share/checkperms  2013-10-27 07:02:13.000000000 -0700
+++ b/src/share/checkperms  2013-10-27 07:06:03.000000000 -0700
@@ -1,4 +1,4 @@
-#!/usr/bin/perl -T
+#!/usr/bin/env perl

 # checkperms: ensure as best we can that a given file can only be
 # modified by the given user (or the superuser, naturally).  This
diff -ur a/src/share/keytrans b/src/share/keytrans
--- a/src/share/keytrans  2013-10-27 07:02:13.000000000 -0700
+++ b/src/share/keytrans  2013-10-27 07:05:10.000000000 -0700
@@ -1,4 +1,4 @@
-#!/usr/bin/perl -T
+#!/usr/bin/env perl

 # keytrans: this is an RSA key translation utility; it is capable of
 # transforming RSA keys (both public keys and secret keys) between
