require "httparty"
require "paystack/api_resource/resource"
require "paystack/api_resource/payment_page"
require "paystack/api_resource/product"
require "paystack/client/payment_pages"
require "paystack/client/products"

module Paystack
  class ExpiredTokenError < StandardError; end
  class ApiResponseError < StandardError; end

  class Client
    include HTTParty
    include Paystack::Client::PaymentPages
    include Paystack::Client::Products

    attr_accessor :public_key, :private_key

    BASE_URI = "https://api.paystack.co/"

    def initialize(options = {})
      options.each do |key, value|
        instance_variable_set("@#{key}", value)
      end

      @base_uri = BASE_URI

      yield(self) if block_given?
    end

    def init!
      self
    end

    def request(resource = nil)
      max_retries = 2
      retries = 0

      begin
        parsed_response = JSON.parse(yield)
        handle_errors(parsed_response)

        case parsed_response["data"]
        when Array
          handle_array_response(parsed_response["data"], resource)
        when Hash
          handle_hash_response(parsed_response["data"], resource)
        else
          parsed_response
        end
      end
    end

    private

    def handle_errors(response)
      return if response["status"] == true

      raise(ApiResponseError, "#{response["message"]}")
    end

    def handle_array_response(response, resource)
      response.map { |item| resource.new(item) } if resource
    end

    def handle_hash_response(response, resource)
      resource.new(response) if resource
    end
  end
end
