class EasyRsa < Formula
  desc "Homebrew formula for `easy-rsa`"
  homepage "https://github.com/OpenVPN/easy-rsa"
  url "https://github.com/OpenVPN/easy-rsa/archive/v3.0.6.tar.gz"
  sha256 "2a87c0c617bbfab556c541b83fa5bfdf1c244bfb16b530ca12efb3d979e85191"
  head "https://github.com/OpenVPN/easy-rsa.git"

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

    share.install %w[
      easyrsa3/easyrsa
      easyrsa3/openssl-easyrsa.cnf
      easyrsa3/vars.example
      easyrsa3/x509-types
    ]

    doc.install "ChangeLog"
    doc.install "COPYING.md"
    doc.install "KNOWN_ISSUES"
    doc.install "README.md"
    doc.install "README.quickstart.md"

    bin.install_symlink share/"easyrsa" => "easyrsa"
  end
end
