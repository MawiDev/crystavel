class MainLayout
  include Blueprint::HTML

  private def around_render(&)
    html do
      head do
        title { "My Crystal App" }
        link(rel: "stylesheet", href: "https://cdn.jsdelivr.net/npm/@picocss/pico@2/css/pico.min.css")
      end
      body do
        nav do
            a(href: "/", style: "text-decoration:none") { "Home" }
        end
        yield
      end
    end
  end
end
