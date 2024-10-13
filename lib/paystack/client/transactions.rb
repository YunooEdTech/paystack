# frozen_string_literal: true

module Paystack
  class Client
    module Transactions
      BASE = "/transaction"

      def initialize_transaction(options = {})
        request(ApiResource::Transaction) do
          self.class.post("#{@base_uri}/#{BASE}/initialize", {
                            body: options.to_json,
                            headers: {
                              "Content-Type" => "application/json",
                              "Authorization" => "Bearer #{private_key}"
                            }
                          }).body
        end
      end

      def verify_transaction(reference)
        request(ApiResource::Transaction) do
          self.class.get("#{@base_uri}/#{BASE}/verify/#{reference}", {
                           headers: {
                             "Content-Type" => "application/json",
                             "Authorization" => "Bearer #{private_key}"
                           }
                         }).body
        end
      end

      def retrieve_transactions(options = {})
        request(ApiResource::Transaction) do
          self.class.get("#{@base_uri}/#{BASE}", {
                           query: options,
                           headers: {
                             "Authorization" => "Bearer #{private_key}",
                             "Content-Type" => "application/json"
                           }
                         }).body
        end
      end

      def retrieve_transaction(id)
        request(ApiResource::Transaction) do
          self.class.get("#{@base_uri}/#{BASE}/#{id}", {
                           headers: {
                             "Authorization" => "Bearer #{private_key}",
                             "Content-Type" => "application/json"
                           }
                         }).body
        end
      end

      def charge_authorization(options = {})
        request(ApiResource::Transaction) do
          self.class.post("#{@base_uri}/#{BASE}/charge_authorization", {
                            body: options.to_json,
                            headers: {
                              "Content-Type" => "application/json",
                              "Authorization" => "Bearer #{private_key}"
                            }
                          }).body
        end
      end

      def view_transaction_timeline(id)
        request(ApiResource::Transaction) do
          self.class.get("#{@base_uri}/#{BASE}/timeline/#{id}", {
                           headers: {
                             "Authorization" => "Bearer #{private_key}",
                             "Content-Type" => "application/json"
                           }
                         }).body
        end
      end

      def transaction_totals(options = {})
        request(ApiResource::Transaction) do
          self.class.get("#{@base_uri}/#{BASE}/totals", {
                           query: options,
                           headers: {
                             "Authorization" => "Bearer #{private_key}",
                             "Content-Type" => "application/json"
                           }
                         }).body
        end
      end

      def export_transactions(options = {})
        request(ApiResource::Transaction) do
          self.class.get("#{@base_uri}/#{BASE}/export", {
                           query: options,
                           headers: {
                             "Authorization" => "Bearer #{private_key}",
                             "Content-Type" => "application/json"
                           }
                         }).body
        end
      end

      def partial_debit(options = {})
        request(ApiResource::Transaction) do
          self.class.post("#{@base_uri}/#{BASE}/partial_debit", {
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
