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
              "#set_var EASYRSA\t\"$PWD\"",
              "set_var EASYRSA \"#{Formula["easy-rsa"].opt_prefix}/share\""

    inreplace "easyrsa3/vars.example",
              "#set_var EASYRSA_OPENSSL\t\"openssl\"",
              "set_var EASYRSA_OPENSSL \"#{Formula["openssl"].opt_prefix}/bin/openssl\""

    inreplace "easyrsa3/easyrsa",
              "\tlocal prog_vars=\"${0%/*}/vars\"",
              "\tlocal prog_vars=\"#{Formula["easy-rsa"].opt_prefix}/share/vars\""

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
    share.install share/"vars.example" => "vars"
  end
end
