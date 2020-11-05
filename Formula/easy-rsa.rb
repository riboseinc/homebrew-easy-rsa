class EasyRsa < Formula
  desc "Homebrew formula for `easy-rsa`"
  homepage "https://github.com/OpenVPN/easy-rsa"
  url "https://github.com/OpenVPN/easy-rsa/archive/v3.0.8.tar.gz"
  sha256 "fd6b67d867c3b8afd53efa2ca015477f6658a02323e1799432083472ac0dd200"
  head "https://github.com/OpenVPN/easy-rsa.git"

  def install
    inreplace "easyrsa3/vars.example",
              "#set_var EASYRSA\t\"${0%/*}\"",
              "#set_var EASYRSA \"#{Formula["easy-rsa"].opt_prefix}/share\""

    inreplace "easyrsa3/easyrsa",
              "\tprog_dir=\"${prog_file%/*}\"",
              "\tprog_dir=\"#{Formula["easy-rsa"].opt_prefix}/share\""

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
