
class ExampleController
     def response(env)

        req = Rack::Request.new(env)
        puts req.params['a']
        puts req.params['b']

        rsp = Rack::Response.new
        rsp.write "got a request"



        return rsp.finish
    end
end
