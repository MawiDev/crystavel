require "../core/router"
require "../controllers/home_controller"
require "../middleware/log_middleware"

module Routes
  def self.draw(router : Router)
    # GET /
    router.get "/" do |ctx, _params|
      LogMiddleware.call(ctx) do
        # Successivamente, esegui il controller
        HomeController.index(ctx)
      end
    end

    # Aggiungi qui altre rotte
  end
end
