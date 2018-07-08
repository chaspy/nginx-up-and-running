require 'spec_helper'

describe server(:proxy) do
  describe http('http://13.231.128.64') do
    it 'returns 200' do
      expect(response.status).to eq(200)
    end
  end
end
