# frozen_string_literal: true

module Paystack
  class Client
    module PaymentPages
      BASE = "/page"

      def retrieve_pages(options = {})
        request(ApiResource::PaymentPage) do
          self.class.get("#{@base_uri}/#{BASE}", {

                           query: options,
                           headers: {
                             "Authorization" => "Bearer #{private_key}",
                             "Content-Type" => "application/json"
                           }
                         }).body
        end
      end

      def retrieve_page(id)
        request(ApiResource::PaymentPage) do
          self.class.get("#{@base_uri}/#{BASE}/#{id}", {

                           query: options,
                           headers: {
                             "Authorization" => "Bearer #{private_key}",
                             "Content-Type" => "application/json"
                           }
                         }).body
        end
      end

      def add_products_to_page(id, options = {})
        request(ApiResource::PaymentPage) do
          self.class.post("#{@base_uri}/#{BASE}/#{id}/product", {
                            body: options.to_json,
                            headers: {
                              "Authorization" => "Bearer #{private_key}",
                              "Content-Type" => "application/json"
                            }
                          }).body
        end
      end

      def create_page(options = {})
        request(ApiResource::PaymentPage) do
          self.class.post("#{@base_uri}/#{BASE}", {
                            body: options.to_json,
                            headers: {
                              "Content-Type" => "application/json",
                              "Authorization" => "Bearer #{private_key}"
                            }
                          }).body
        end
      end
    end
  end
end
