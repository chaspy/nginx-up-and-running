require 'spec_helper'

describe server(:nginx) do
  describe http('http://nginx') do
    it 'returns 200' do
      expect(response.status).to eq(200)
    end
  end

  describe http('http://nginx/hello') do
    it 'returns 200' do
      expect(response.status).to eq(200)
      expect(response.body).to include('Hello, world!')
    end
  end

  describe http('http://nginx/fizzbuzz', params: {'n' => 1}) do
    it 'returns 1' do
      expect(response.status).to eq(200)
      expect(response.body).to eq('1')
    end
  end

  describe http('http://nginx/fizzbuzz', params: {'n' => 3}) do
    it 'returns Fizz' do
      expect(response.status).to eq(200)
      expect(response.body).to eq('Fizz')
    end
  end

  describe http('http://nginx/fizzbuzz', params: {'n' => 5}) do
    it 'returns Buzz' do
      expect(response.status).to eq(200)
      expect(response.body).to eq('Buzz')
    end
  end

  describe http('http://nginx/fizzbuzz', params: {'n' => 15}) do
    it 'returns FizzBuzz' do
      expect(response.status).to eq(200)
      expect(response.body).to eq('FizzBuzz')
    end
  end

  describe http('http://nginx/maintenance') do
    it 'returns 403' do
      expect(response.status).to eq(403)
    end
  end
end
