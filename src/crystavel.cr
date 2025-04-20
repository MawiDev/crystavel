# Crystavel
#
# Crystavel is a lightweight web framework built in Crystal. This is a simple
# implementation with server setup, routing, and middleware management. It's designed
# to help you quickly set up a web application with minimal configuration.
#
# Version: 0.1.0

require "./core/server"

module Crystavel
  # The version of the Crystavel framework
  VERSION = "0.1.0"
  # Server const
  PORT = 3000
  HOST = "127.0.0.1"

  # Otteniamo l'istanza del server come singleton
  server = Server.new(PORT,HOST) # Passiamo il parametro per la porta
  # Avviamo il server
  server.start
end
