class EasyRsa < Formula
  desc "Homebrew formula for `easy-rsa`"
  homepage 'https://github.com/OpenVPN/easy-rsa'
  url "https://github.com/OpenVPN/easy-rsa/archive/v3.0.5.tar.gz"
  sha256 "01d0a0b0105fb80742455cef8b6336fcb67bf69c8675d3bbd66fdf741fd6d34f"
  head "https://github.com/OpenVPN/easy-rsa.git"

  devel do
    version '3.0.4'
  end

  def install    
    inreplace "easyrsa3/vars.example",
              "#set_var EASYRSA\t\"${0%/*}\"",
              "#set_var EASYRSA \"#{Formula["easy-rsa"].opt_prefix}/share\""    

    inreplace "easyrsa3/easyrsa",
              "set_var EASYRSA\t\t\"${0%/*}\"",
              "set_var EASYRSA \"#{Formula["easy-rsa"].opt_prefix}/share\""

    inreplace "easyrsa3/easyrsa",
              "\tprog_vars=\"${0%/*}/vars\"",
              "\tprog_vars=\"#{Formula["easy-rsa"].opt_prefix}/share/vars\""


    share.install %w(
      easyrsa3/easyrsa
      easyrsa3/openssl-easyrsa.cnf
      easyrsa3/vars.example
      easyrsa3/x509-types
    )

    doc.install "ChangeLog"
    doc.install "COPYING.md"
    doc.install "KNOWN_ISSUES"
    doc.install "README.md"
    doc.install "README.quickstart.md"

    bin.install_symlink share/"easyrsa" => "easyrsa"
  end
end
