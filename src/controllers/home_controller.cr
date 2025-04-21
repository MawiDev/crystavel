require "http/server"
require "json"
require "../views/welcome"

module HomeController
  def self.index(ctx : HTTP::Server::Context)
    view = Welcome.new "Ciao mondo"

    ctx.response.content_type = "text/html"
    ctx.response.print view.to_s
  end
end
