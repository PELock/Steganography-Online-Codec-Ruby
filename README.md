# Steganography Online Codec SDK for Ruby

**Steganography Online Codec** allows you to hide a password encrypted message within the images & photos using [AES](https://www.youtube.com/watch?v=O4xNJsjtN6E)
encryption algorithm with a 256-bit [PBKDF2](https://en.wikipedia.org/wiki/PBKDF2) derived key.

You can use it for free at:

https://www.pelock.com/products/steganography-online-codec

This SDK provides programming access to the codec and its encoding and decoding functions through a WebAPI interface.

## What is steganography & how it works?

Steganography is a term describing the art and science of hiding information by embedding messages within other, seemingly harmless image files.

In this case, the individual bits of the encrypted hidden message are saved as the least significant (LSB) bits in the
RGB color components in the pixels of the selected image.

![Steganography Online Codec - Hide Message in Image](https://www.pelock.com/img/en/products/steganography-online-codec/steganography-online-codec.png)

With our steganographic encoder you will be able to conceal any text message in the image in a secure way and
send it without raising any suspicion. It will only be possible to read the message after providing valid, decryption
password.

## Installation

The preferred way to install the Web API SDK is via RubyGems.

```bash
gem install steganography-online-codec
```

```ruby
require "steganography-online-codec"
```

The gem is published at https://rubygems.org/gems/steganography-online-codec

## Packages for other programming languages

The installation packages have been uploaded to repositories for several popular programming languages and their source codes have been published on GitHub:

| Repository   | Language | Installation | Package | GitHub |
| ---------- | -------- | ------------ | ------- | ------ |
| ![PyPI repository for Python](https://www.pelock.com/img/logos/repo-pypi.png) | Python | Run `pip install steganography-online-codec` | [PyPI](https://pypi.org/project/steganography-online-codec/) | [Sources](https://github.com/PELock/Steganography-Online-Codec-Python) |
| ![NPM repository for JavaScript and TypeScript](https://www.pelock.com/img/logos/repo-npm.png) | JavaScript, TypeScript | Run `npm i steganography-online-codec` or add `"steganography-online-codec": "latest"` under `dependencies` in `package.json` | [NPM](https://www.npmjs.com/package/steganography-online-codec) | [Sources](https://github.com/PELock/Steganography-Online-Codec-JavaScript) |
| ![Rust crates.io](https://www.pelock.com/img/logos/repo-crates.png) | Rust | Run `cargo add steganography-online-codec` or add `steganography-online-codec = "1"` to `Cargo.toml` (optional: `git` / `path` for unreleased or vendored builds) | [crates.io](https://crates.io/crates/steganography-online-codec) | [Sources](https://github.com/PELock/Steganography-Online-Codec-Rust) |

### Example — `encode_decode.rb`

```ruby
# frozen_string_literal: true

###############################################################################
#
# Steganography Online Codec — encode / decode
#
# Version        : v1.0.2
# Language       : Ruby
# Author         : Bartosz Wójcik
# Web page       : https://www.pelock.com
#
###############################################################################

$LOAD_PATH.unshift(File.expand_path("../lib", __dir__))
require "steganography-online-codec"

client = SteganographyOnlineCodec.new("YOUR-WEB-API-KEY")
result = client.encode("input_file.jpg", "Secret message", "Pa$$word", "output_hidden.png")

if result["error"] == SteganographyOnlineCodec::Errors::SUCCESS
  puts "Secret message encoded."
  extracted = client.decode("output_hidden.png", "Pa$$word")
  p extracted
else
  warn "Error code: #{result["error"]}"
end
```

### Example — `login.rb`

```ruby
# frozen_string_literal: true

###############################################################################
#
# Steganography Online Codec — login
#
# Version        : v1.0.2
# Language       : Ruby
# Author         : Bartosz Wójcik
# Web page       : https://www.pelock.com
#
###############################################################################

$LOAD_PATH.unshift(File.expand_path("../lib", __dir__))
require "steganography-online-codec"

client = SteganographyOnlineCodec.new("YOUR-WEB-API-KEY")
p client.login
```

See the `examples/` directory in this repository for complete samples.

## Got questions?

If you are interested in the Steganography Online Codec Web API or have any questions regarding SDK packages, technical or if something is not clear, [please contact me](https://www.pelock.com/contact). I'll be happy to answer all of your questions.

Bartosz Wójcik

* Visit my site at — https://www.pelock.com
* X — https://x.com/PELock
* GitHub — https://github.com/PELock