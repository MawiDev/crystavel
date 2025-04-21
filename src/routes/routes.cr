require "../core/router"
require "../controllers/home_controller"
require "../middleware/log_middleware"

module Routes
  def self.draw(router : Router)

    router.get "/" do |ctx, _params|
      LogMiddleware.call(ctx) do
        HomeController.index(ctx)
      end
    end

    # Aggiungi qui altre rotte
  end
end
