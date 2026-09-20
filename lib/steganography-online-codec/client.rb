# frozen_string_literal: true

require "base64"

class SteganographyOnlineCodec
  API_URL = "https://www.pelock.com/api/steganography-online-codec/v1"
  USER_AGENT = "PELock Steganography Online Codec"

  def initialize(api_key = nil)
    @api_key = api_key
  end

  def login
    post_request("command" => "login")
  end

  def encode(input_image_path, message_to_hide, password, output_image_path)
    result = post_request(
      "command" => "encode",
      "message" => message_to_hide,
      "password" => password,
      image_path: input_image_path
    )

    return result unless result["error"] == Errors::SUCCESS

    begin
      encoded = result["encodedImage"]
      return { "error" => Errors::OUTPUT_FILE } if encoded.nil? || encoded.to_s.empty?

      binary = Base64.decode64(encoded.to_s)
      return { "error" => Errors::OUTPUT_FILE } if binary.nil? || binary.empty?

      File.binwrite(output_image_path, binary)
      result.delete("encodedImage")
      result
    rescue StandardError
      { "error" => Errors::OUTPUT_FILE }
    end
  end

  def decode(input_image_path, password)
    post_request(
      "command" => "decode",
      "password" => password,
      image_path: input_image_path
    )
  end

  def post_request(params_array)
    default_error = { "error" => Errors::WEBAPI_CONNECTION }
    params = params_array.dup
    image_path = params.delete(:image_path)
    params["key"] = @api_key unless @api_key.nil? || @api_key.to_s.empty?

    files = {}
    if image_path
      return { "error" => Errors::INVALID_INPUT } unless File.file?(image_path)

      files["image"] = { path: image_path, filename: File.basename(image_path) }
    end

    body = Http.post_multipart(API_URL, params, user_agent: USER_AGENT, files: files)
    return default_error if body.nil? || body.empty?

    result = Http.parse_json(body)
    result.is_a?(Hash) ? result : default_error
  end

  def convert_size(size_bytes)
    size_bytes = size_bytes.to_f
    return "0 bytes" if size_bytes <= 0

    size_name = %w[bytes kB MB GB TB PB EB ZB YB]
    i = Math.log(size_bytes, 1024).floor
    p = 1024**i
    s = (size_bytes / p).round(2)
    "#{s} #{size_name[i]}"
  end
end
