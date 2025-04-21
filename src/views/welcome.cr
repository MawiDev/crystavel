require "blueprint/html"

class Welcome
  include Blueprint::HTML

  private def blueprint
    h1 { "hello  word" }
  end
end