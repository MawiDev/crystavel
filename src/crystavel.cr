# Crystavel
#
# Version: 0.1.0

require "./core/server"

module Crystavel
  VERSION = "0.1.0"

  PORT = 3000
  HOST = "127.0.0.1"

  server = Server.new(PORT,HOST)
  server.start
end
