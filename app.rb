require 'rack'
require 'rack/server'
require 'json'

class Router

    def self.match(env, method, path)
        return false unless env['REQUEST_METHOD']==method
        return false unless env['REQUEST_PATH']==path
        return true
    end


    def self.call(env)

        puts JSON.pretty_generate(env)

        if match(env, 'GET', '/example')
            load 'example_controller.rb'
            return ExampleController.new.response(env)
        else
            return [404,{},"page not found"]
        end

    end
end


def main

    opts = {
        Host: '0.0.0.0',
        Port: 1234
    }

    Rack::Handler::Thin.run(Router, opts) do |server|
        server.maximum_connections=10
        #p server
    end

    #Rack::Handler::WEBrick.run(Router, opts)

end

main if $0==__FILE__

