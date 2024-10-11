# frozen_string_literal: true

module Paystack
  class Client
    module Products
      BASE = "/product"

      def create_product(options = {})
        request(ApiResource::Product) do
          self.class.post("#{@base_uri}/#{BASE}", {
                            body: options.to_json,
                            headers: {
                              "Content-Type" => "application/json",
                              "Authorization" => "Bearer #{private_key}"
                            }
                          }).body
        end
      end

      def retrieve_products(options = {})
        request(ApiResource::Product) do
          self.class.get("#{@base_uri}/#{BASE}", {

                           query: options,
                           headers: {
                             "Authorization" => "Bearer #{private_key}",
                             "Content-Type" => "application/json"
                           }
                         }).body
        end
      end

      def retrieve_product(id)
        request(ApiResource::Product) do
          self.class.get("#{@base_uri}/#{BASE}/#{id}", {
                           headers: {
                             "Authorization" => "Bearer #{private_key}",
                             "Content-Type" => "application/json"
                           }
                         }).body
        end
      end

      def update_product(id, options = {})
        request(ApiResource::Product) do
          self.class.put("#{@base_uri}/#{BASE}/#{id}", {
                           body: options.to_json,
                           headers: {
                             "Authorization" => "Bearer #{private_key}",
                             "Content-Type" => "application/json"
                           }
                         }).body
        end
      end
    end
  end
end
