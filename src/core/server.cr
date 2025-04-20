# core/server.cr
require "http/server"
require "./router"
require "../routes/routes"

class Server
  getter router : Router
  getter port : Int32

  # Variabili di classe per memorizzare l'istanza
  @@instance : Server? = nil

  # Metodo per ottenere l'istanza del singleton
  def self.instance(port = 3000)
    @@instance ||= new(port) # Crea un'istanza solo se non esiste già
  end

  # Preveniamo la creazione diretta di nuove istanze
  private def initialize(@port = 3000)
    @router = Router.new
    Routes.draw(@router)
  end

  # Metodo per avviare il server
  def start
    server = HTTP::Server.new do |context|
      @router.call(context)
    end

    # Binding dell'indirizzo
    address = server.bind_tcp("0.0.0.0", @port)
    puts "🚀 Server listening on http://#{address}"

    # Avvio del server
    server.listen
  end
end
