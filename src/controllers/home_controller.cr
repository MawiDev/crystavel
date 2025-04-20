require "http/server"

module HomeController
  def self.index(ctx : HTTP::Server::Context)
    ctx.response.print "homepage"
  end
end
