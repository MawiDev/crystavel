require "blueprint/html"

class Welcome
  include Blueprint::HTML

  def initialize(@message : String); end

  private def blueprint
    div do
      h1 { @message }
    end
  end
end
