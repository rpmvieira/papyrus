Rails.application.routes.draw do
  resources :eventos
  resources :mensagens
  resources :engajamentos do

    resources :engajados, module: :engajamentos do
      post :show
      

      post 'engajado_new'=>'engajados#engajado_new', as: :engajado_new, :on => :collection # deveria ira para #engajados_controller para dispensar o 'as:'
      post 'lideranca_create' => 'engajados#lideranca_create', as: :lideranca_create, :on => :collection
      post :colaborador_new#
      post 'colaborador_create' => 'engajados#colaborador_create', as: :colaborador_create

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
