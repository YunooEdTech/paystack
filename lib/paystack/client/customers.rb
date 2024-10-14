# frozen_string_literal: true

module Paystack
  class Client
    module Customers
      BASE = "/customer"

      def create_customer(options = {})
        request(ApiResource::Customer) do
          self.class.post("#{@base_uri}/#{BASE}", {
                            body: options.to_json,
                            headers: {
                              "Content-Type" => "application/json",
                              "Authorization" => "Bearer #{private_key}"
                            }
                          }).body
        end
      end

      def retrieve_customers(options = {})
        request(ApiResource::Customer) do
          self.class.get("#{@base_uri}/#{BASE}", {

                           query: options,
                           headers: {
                             "Authorization" => "Bearer #{private_key}",
                             "Content-Type" => "application/json"
                           }
                         }).body
        end
      end

      def retrieve_customer(id)
        request(ApiResource::Customer) do
          self.class.get("#{@base_uri}/#{BASE}/#{id}", {
                           headers: {
                             "Authorization" => "Bearer #{private_key}",
                             "Content-Type" => "application/json"
                           }
                         }).body
        end
      end

      def update_customer(id, options = {})
        request(ApiResource::Customer) do
          self.class.put("#{@base_uri}/#{BASE}/#{id}", {
                           body: options.to_json,
                           headers: {
                             "Authorization" => "Bearer #{private_key}",
                             "Content-Type" => "application/json"
                           }
                         }).body
        end
      end

      def validate_customer(id, options = {})
        request(ApiResource::Customer) do
          self.class.post("#{@base_uri}/#{BASE}/#{id}/identification", {
                            body: options.to_json,
                            headers: {
                              "Content-Type" => "application/json",
                              "Authorization" => "Bearer #{private_key}"
                            }
                          }).body
        end
      end

      def whitelist_blacklist_customer(options = {})
        request(ApiResource::Customer) do
          self.class.post("#{@base_uri}/#{BASE}/set_risk_action", {
                            body: options.to_json,
                            headers: {
                              "Content-Type" => "application/json",
                              "Authorization" => "Bearer #{private_key}"
                            }
                          }).body
        end
      end

      def deactivate_authorization(options = {})
        request(ApiResource::Customer) do
          self.class.post("#{@base_uri}/#{BASE}/deactivate_authorization", {
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
