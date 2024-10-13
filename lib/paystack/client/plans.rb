# frozen_string_literal: true

module Paystack
  class Client
    module Plans
      BASE = "/plan"

      def create_plan(options = {})
        request(ApiResource::Plan) do
          self.class.post("#{@base_uri}/#{BASE}", {
                            body: options.to_json,
                            headers: {
                              "Content-Type" => "application/json",
                              "Authorization" => "Bearer #{private_key}"
                            }
                          }).body
        end
      end

      def retrieve_plans(options = {})
        request(ApiResource::Plan) do
          self.class.get("#{@base_uri}/#{BASE}", {
                           query: options,
                           headers: {
                             "Authorization" => "Bearer #{private_key}",
                             "Content-Type" => "application/json"
                           }
                         }).body
        end
      end

      def retrieve_plan(id)
        request(ApiResource::Plan) do
          self.class.get("#{@base_uri}/#{BASE}/#{id}", {
                           headers: {
                             "Authorization" => "Bearer #{private_key}",
                             "Content-Type" => "application/json"
                           }
                         }).body
        end
      end

      def update_plan(id, options = {})
        request(ApiResource::Plan) do
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
