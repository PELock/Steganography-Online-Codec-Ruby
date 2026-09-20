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
