# core/server.cr
require "http/server"
require "./router"
require "../routes/routes"

class Server
  getter router : Router
  getter port : Int32
  getter host : String

  # Preveniamo la creazione diretta di nuove istanze
  def initialize(@port = 3000,@host = "0.0.0.0")
    @router = Router.new
    Routes.draw(@router)
  end

  # Metodo per avviare il server
  def start
    server = HTTP::Server.new do |context|
      @router.call(context)
    end

    # Binding dell'indirizzo
    address = server.bind_tcp(@host, @port)
    puts "🚀 Server listening on http://#{address}"

    # Avvio del server
    server.listen
  end
end
