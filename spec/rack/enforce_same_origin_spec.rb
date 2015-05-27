require 'spec_helper'

describe Rack::EnforceSameOrigin do
  let(:app) { Proc.new {[200, { 'X-TEST' => 'TEST' }, [ ]]} }
  let(:request) { Rack::EnforceSameOrigin.new(app) }
  let(:response) { request.call({ }) }
  let(:response_headers) { response[1] }

   it 'sets X-FRAME-OPTIONS correctly' do
     expect(response_headers['X-FRAME-OPTIONS']).to eq 'SAMEORIGIN'
   end
end
