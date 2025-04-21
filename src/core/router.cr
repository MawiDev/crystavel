require "http/server"

class Router
  alias Handler = Proc(HTTP::Server::Context, Array(String), Nil)

  def initialize
    @routes = [] of {String, Regex, Handler}
  end

  def get(path : String, &block : HTTP::Server::Context, Array(String) ->)
    regex = path_to_regex(path)
    @routes << {"GET", regex, block}
  end

  def post(path : String, &block : HTTP::Server::Context, Array(String) ->)
    regex = path_to_regex(path)
    @routes << {"POST", regex, block}
  end

  def call(context : HTTP::Server::Context)
    method = context.request.method
    path = context.request.path

    @routes.each do |(route_method, regex, handler)|
      if method == route_method
        match = regex.match(path)
        if match
          captures = match.captures.compact
          handler.call(context, captures)
          return
        end
      end
    end

    context.response.status_code = 404
    context.response.print "Not Found"
  end

  private def path_to_regex(path : String) : Regex
    regex_str = path.gsub(/:[^\/]+/, "([^/]+)")
    Regex.new("^#{regex_str}$")
  end
end
