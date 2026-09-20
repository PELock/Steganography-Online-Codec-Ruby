# Steganography Online Codec — Ruby Web API SDK

Ruby SDK for [Steganography Online Codec](https://www.pelock.com/products/steganography-online-codec).

API: https://www.pelock.com/api/steganography-online-codec/v1

Author: Bartosz Wójcik / PELock — https://www.pelock.com

## Installation

This gem is not published on RubyGems. Build it locally:

```bash
gem build steganography-online-codec.gemspec
gem install steganography-online-codec-*.gem
```

Or from a clone without installing:

```ruby
$LOAD_PATH.unshift(File.expand_path("lib", __dir__))
require "steganography-online-codec"
```

Uses Ruby stdlib `Net::HTTP` only (no Faraday).

## Usage

```ruby
require "steganography-online-codec"

client = SteganographyOnlineCodec.new("YOUR-WEB-API-KEY")
encoded = client.encode("input.jpg", "Secret message", "Pa$$word", "output.png")
decoded = client.decode("output.png", "Pa$$word")
```

See `examples/`.

`encode` / `decode` send the image as a multipart file field.

## License

Apache-2.0. Copyright Bartosz Wójcik / PELock.
