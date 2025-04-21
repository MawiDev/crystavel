require "blueprint/html"
require "./layouts/main_layout"

class Welcome < MainLayout
  def initialize(@message : String); end

  private def blueprint
    div do
      h1 { @message }
    end
  end
end
