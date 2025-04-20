# middleware/log_middleware.cr
require "http/server"

module LogMiddleware
  # Define the `call` method that accepts a context (ctx) and a block.
  def self.call(ctx : HTTP::Server::Context, &block)
    # Log some details about the incoming request
    log_request(ctx)

    # Pass control to the next middleware/controller
    block.call
  end

  # A helper method to log details about the request
  private def self.log_request(ctx : HTTP::Server::Context)
    # Example log output
    puts "Request Method: #{ctx.request.method}"
    puts "Request Path: #{ctx.request.path}"
    puts "Request Time: #{Time.utc}"
  end
end
