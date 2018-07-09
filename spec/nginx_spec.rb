require 'spec_helper'

describe server(:nginx) do
  describe http('http://nginx') do
    it 'returns 200' do
      expect(response.status).to eq(200)
    end
  end
end
