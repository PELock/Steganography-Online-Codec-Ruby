# frozen_string_literal: true

class SteganographyOnlineCodec
  module Errors
    WEBAPI_CONNECTION = -1
    SUCCESS = 0
    UNKNOWN = 1
    MESSAGE_TOO_LONG = 2
    IMAGE_TOO_BIG = 3
    INVALID_INPUT = 4
    INVALID_IMAGE_FORMAT = 5
    IMAGE_MALFORMED = 6
    INVALID_PASSWORD = 7
    LIMIT_MESSAGE = 9
    LIMIT_PASSWORD = 10
    OUTPUT_FILE = 99
    INVALID_LICENSE = 100
  end
end
