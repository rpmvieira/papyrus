Rails.application.routes.draw do
  resources :engajamentos do
    # get 'show' => 'engajamentos#show', as: :mostrar
    resources :engajados, module: :engajamentos do
      post :show
      post 'criar' => 'engajados#create', as: :criar, :on => :collection
      post :new, as: :novo_engajado, :on => :collection
      post :contato_novo
      post :contato_create
      post :endereco_novo
      post :endereco_create
    end
  end
  devise_for :usuarios
  resources :pessoas do
    resources :contatos, module: :pessoas do
      post :create#, :as => :usuario_nova_busca
    end
  end
  resources :contatos
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "engajamentos#index"
end
