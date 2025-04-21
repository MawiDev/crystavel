require "http/server"
require "json"
require "../views/welcome"

module HomeController
  def self.index(ctx : HTTP::Server::Context)
    ctx.response.content_type = "text/html"
    ctx.response.print Welcome.new("Ciao mondo").to_s
  end
end
