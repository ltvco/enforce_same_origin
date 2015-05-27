require 'spec_helper'

describe Rack::EnforceSameOrigin do
  let(:app) { Proc.new {[200, { 'X-Test' => 'TEST' }, [ ]]} }
  let(:request) { Rack::EnforceSameOrigin.new(app) }
  let(:response) { request.call({ }) }
  let(:response_headers) { response[1] }

  it 'sets X-Frame-Options correctly' do
    expect(response_headers['X-Frame-Options']).to eq 'SAMEORIGIN'
  end
  
  context "when the header is already set" do
    let(:app) { Proc.new {[200, { 'X-Frame-Options' => 'SAMEORIGIN' }, [ ]]} }
    
    it "doesn't duplicate the X-Frame-Options" do
      expect(response_headers['X-Frame-Options']).to eq 'SAMEORIGIN'
    end
  end
end
