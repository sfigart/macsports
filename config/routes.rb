PalMoanalua::Application.routes.draw do
  resources :registrations do
    member do
      get 'thankyou'
    end
  end

  resources :basketballs, :controller => "registrations", :type => "Basketball"  
  resources :volleyballs, :controller => "registrations", :type => "Volleyball"
  
  devise_for :users
  resources :users
  
  devise_scope :user do
    get "/cnaks" => "devise/sessions#new"
  end

  match '/privacy' => "home#privacy"
  match '/home' => "home#index"
  match '/home/basketball' => "home#basketball"
  match '/home/volleyball' => "home#volleyball"
  
  root :to => "home#index"
end