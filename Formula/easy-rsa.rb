class EasyRsa < Formula
  desc "Homebrew formula for `easy-rsa`"
  homepage 'https://github.com/OpenVPN/easy-rsa'
  url "https://github.com/OpenVPN/easy-rsa/archive/v3.0.4.tar.gz"
  sha256 "1d0da6cfc47b54565fe83068530ed467540879b853670257acb47d107e8f4df3"
  head "https://github.com/OpenVPN/easy-rsa.git"

  depends_on "openssl"

  devel do
    version '3.0.4'
  end

  def install
    inreplace "easyrsa3/vars.example",
              "#set_var EASYRSA\t\"${0%/*}\"",
              "set_var EASYRSA \"#{Formula["easy-rsa"].opt_prefix}/share\""

    inreplace "easyrsa3/easyrsa",
              "set_var EASYRSA\t\t\"${0%/*}\"",
              "set_var EASYRSA \"#{Formula["easy-rsa"].opt_prefix}/share\""

    inreplace "easyrsa3/vars.example",
              "#set_var EASYRSA_OPENSSL\t\"openssl\"",
              "set_var EASYRSA_OPENSSL \"#{Formula["openssl"].opt_prefix}/bin/openssl\""

    inreplace "easyrsa3/easyrsa",
              "set_var EASYRSA_OPENSSL\topenssl",
              "set_var EASYRSA_OPENSSL \"#{Formula["openssl"].opt_prefix}/bin/openssl\""    

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
    # share.install share/"vars.example" => "vars.example"
  end
end
