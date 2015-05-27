module Rack

  class EnforceSameOrigin
    def initialize(app)
      @app = app
    end

    def call(env)
      response = @app.call(env)
      headers = Rack::Utils::HeaderHash.new(response[1])
      headers['X-Frame-Options'] = 'SAMEORIGIN'
      response[1] = headers

      response
    end
  end

end
