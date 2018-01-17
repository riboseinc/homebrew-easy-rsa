# Homebrew for `easy-rsa`

[![Build Status](https://travis-ci.org/riboseinc/homebrew-easy-rsa.svg?branch=master)](https://travis-ci.org/riboseinc/homebrew-easy-rsa)

This tap contains formulae relating to [easy-rsa](https://github.com/OpenVPN/easy-rsa).

## Install Tap

``` sh
brew tap riboseinc/easy-rsa
```

## Install easy-rsa

``` sh
brew install easy-rsa
```

If the formula conflicts with one from `Homebrew/homebrew` or another
tap, you can run:

``` sh
brew install riboseinc/easy-rsa/easy-rsa
```

You can also install via URL:

``` sh
brew install --HEAD https://raw.githubusercontent.com/riboseinc/homebrew-easy-rsa/master/Formula/easy-rsa.rb
```

NOTE: Before using `easy-rsa`, you must set `EASYRSA_SSL_CONF` as the following:

``` sh
EASYRSA_SSL_CONF="$(brew --prefix easy-rsa)/share/openssl-1.0.cnf"
```

## Acceptable Formulae

You can read Homebrew’s Acceptable Formulae document [here](https://github.com/Homebrew/brew/blob/master/docs/Acceptable-Formulae.md).

## Troubleshooting

First, please run `brew update` and `brew doctor`.

Second, read the [Troubleshooting Checklist](https://github.com/Homebrew/brew/blob/master/docs/Troubleshooting.md#troubleshooting).

## More Documentation

`brew help`, `man brew` or check [our documentation](https://github.com/Homebrew/brew/tree/master/docs#readme).

## License

Code is under the [BSD 2 Clause license](https://github.com/Homebrew/brew/tree/master/LICENSE.txt).
