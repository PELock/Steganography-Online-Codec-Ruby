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
