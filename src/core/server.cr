require "http/server"
require "./router"
require "../routes/routes"

class Server
  getter router : Router
  getter port : Int32
  getter host : String

  def initialize(@port = 3000, @host = "0.0.0.0")
    @router = Router.new
    Routes.draw(@router)
  end

  def start
    server = HTTP::Server.new do |context|
      @router.call(context)
    end

    address = server.bind_tcp(@host, @port)
    puts "🚀 Server listening on http://#{address}"

    server.listen
  end
end
