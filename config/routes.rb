SisRede::Application.routes.draw do
  
    root :to => 'first#index', :as => "PaginaInicial"

    match 'first', :controller => 'first',  :action => 'index'

    match ':controller(/:action(/:id))(.:format)'
    match ':controller(/:action(/:id))'

 
end
