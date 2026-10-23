# frozen_string_literal: true

class UbiCli
  on("ai", "api-key").run_on("show") do
    desc "Show details for an inference API key"

    options("ubi ai api-key api-key-id show [options]", key: :api_key_show) do
      on("--reveal", "show the full API key")
    end

    run do |opts|
      iak = @sdk_object
      key = iak.key
      key = masked_api_key(key) unless opts.dig(:api_key_show, :reveal)
      body = []
      body << "id: " << iak.id << "\n"
      body << "key: " << key << "\n"
      response(body)
    end
  end
end
