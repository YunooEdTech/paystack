# frozen_string_literal: true

module Paystack
  class Client
    module PaymentRequests
      BASE = "/paymentrequest"

      def create_payment_request(options = {})
        request(ApiResource::PaymentRequest) do
          self.class.post("#{@base_uri}/#{BASE}", {
                            body: options.to_json,
                            headers: {
                              "Content-Type" => "application/json",
                              "Authorization" => "Bearer #{private_key}"
                            }
                          }).body
        end
      end

      def retrieve_payment_requests(options = {})
        request(ApiResource::PaymentRequest) do
          self.class.get("#{@base_uri}/#{BASE}", {

                           query: options,
                           headers: {
                             "Authorization" => "Bearer #{private_key}",
                             "Content-Type" => "application/json"
                           }
                         }).body
        end
      end

      def retrieve_payment_request(id)
        request(ApiResource::PaymentRequest) do
          self.class.get("#{@base_uri}/#{BASE}/#{id}", {
                           headers: {
                             "Authorization" => "Bearer #{private_key}",
                             "Content-Type" => "application/json"
                           }
                         }).body
        end
      end

      def update_payment_request(id, options = {})
        request(ApiResource::PaymentRequest) do
          self.class.put("#{@base_uri}/#{BASE}/#{id}", {
                           body: options.to_json,
                           headers: {
                             "Authorization" => "Bearer #{private_key}",
                             "Content-Type" => "application/json"
                           }
                         }).body
        end
      end

      def verify_payment_request(id)
        request(ApiResource::PaymentRequest) do
          self.class.get("#{@base_uri}/#{BASE}/verify/#{id}", {
                           headers: {
                             "Content-Type" => "application/json",
                             "Authorization" => "Bearer #{private_key}"
                           }
                         }).body
        end
      end

      def payment_request_total
        request(ApiResource::PaymentRequest) do
          self.class.get("#{@base_uri}/#{BASE}/totals", {
                           headers: {
                             "Content-Type" => "application/json",
                             "Authorization" => "Bearer #{private_key}"
                           }
                         }).body
        end
      end

      def archive_payment_request(id)
        request(ApiResource::PaymentRequest) do
          self.class.post("#{@base_uri}/#{BASE}/archive/#{id}", {
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
