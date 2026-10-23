# frozen_string_literal: true

require_relative "../../spec_helper"

RSpec.describe Clover, "cli ai api-key show" do
  before do
    @iak = ApiKey.create_inference_api_key(@project)
  end

  it "masks all but the last 4 characters of the key" do
    expect(cli(%W[ai api-key #{@iak.ubid} show])).to eq <<~END
      id: #{@iak.ubid}
      key: ********#{@iak.key[-4..]}
    END
  end

  it "--reveal shows the full key" do
    expect(cli(%W[ai api-key #{@iak.ubid} show --reveal])).to eq <<~END
      id: #{@iak.ubid}
      key: #{@iak.key}
    END
  end
end
