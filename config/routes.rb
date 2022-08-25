Rails.application.routes.draw do
  get 'conteudo/home'
  get 'conteudo/sobre'
  get 'conteudo/notas'
  get 'configuracoes/perfil'

  resources :mensagens
  resources :engajamentos do
    post :show
    post :lideranca_new#, as: :lideranca_new
    post :lideranca_create#, as: :lideranca_create, :on => :collection
    resources :engajados, module: :engajamentos do
      post :index, :on => :collection
      post :show

      post :colaborador_new#
      post 'colaborador_create' => 'engajados#colaborador_create', as: :colaborador_create

      post :contato_novo
      post :contato_create
      post :endereco_novo
      post :endereco_create
    end
    resources :eventos do#, module: :engajamentos do
      post :index, :on => :collection
      post :evento_new, as: :evento_new, :on => :collection
      post :evento_create, as: :evento_create, :on => :collection
      post :show
      post :edit
      patch :update
      post :eventos_dia, :on => :collection
    end
  end
  # devise_for :usuarios
  resources :pessoas do
    resources :contatos, module: :pessoas do
      post :create#, :as => :usuario_nova_busca
    end
  end
  resources :contatos
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "engajamentos#index"




  devise_scope :usuario do
    # Redirests signing out usuarios back to sign-in
    get "usuarios", to: "devise/sessions#new"
    get 'usuarios/sign_out' => 'devise/sessions#destroy' 
  end
  devise_for :usuarios

end
