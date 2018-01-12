class EasyRsa < Formula
  desc "Homebrew formula for `easy-rsa`"
  homepage 'https://github.com/OpenVPN/easy-rsa'
  url "https://github.com/OpenVPN/easy-rsa/archive/v3.0.3.tar.gz"
  sha256 "3e41c0dfebe04332cdc07f13bf48a69e25dfc31d059e94071a9cfb9f3bba6f9a"
  head "https://github.com/OpenVPN/easy-rsa.git"

  depends_on "openssl"

  devel do
    version '3.0.3'
  end

  def install
    inreplace "easyrsa3/vars.example",
              '"C:/Program Files/OpenSSL-Win32/bin/openssl.exe"',
              "\"#{Formula["openssl"].opt_prefix}/bin/openssl\""

    inreplace "easyrsa3/vars.example",
              '"$EASYRSA/openssl-1.0.cnf"',
              '"$PWD/openssl-1.0.cnf"'

    share.install %w(
      easyrsa3/easyrsa
      easyrsa3/openssl-1.0.cnf
      easyrsa3/vars.example
    )

    doc.install "ChangeLog"
    doc.install "COPYING.md"
    doc.install "KNOWN_ISSUES"
    doc.install "README.md"
    doc.install "README.quickstart.md"

    bin.install_symlink share/"easyrsa" => "easyrsa"
  end
end
