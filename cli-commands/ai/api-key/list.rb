# frozen_string_literal: true

class UbiCli
  on("ai", "api-key", "list") do
    desc "List inference API keys"

    key = :api_key_list

    options("ubi ai api-key list [options]", key:) do
      on("-N", "--no-headers", "do not show headers")
    end

    run do |opts|
      opts = opts[key]
      items = sdk.inference_api_key.list.map { {id: it.id, key: masked_api_key(it.key)} }
      response(format_rows(%i[id key], items, headers: opts[:"no-headers"] != false))
    end
  end
end
