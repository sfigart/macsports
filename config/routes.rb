PalMoanalua::Application.routes.draw do
  resources :registrations
  resources :baseballs, :controller => "registrations", :type => "Baseball" do
    member do
      get 'thankyou'
    end
  end
  resources :basketballs, :controller => "registrations", :type => "Basketball" do
    member do
      get 'thankyou'
    end
  end
  resources :footballs, :controller => "registrations", :type => "Football" do
    member do
      get 'thankyou'
    end
  end
  resources :volleyballs, :controller => "registrations", :type => "Volleyball" do
    member do
      get 'thankyou'
    end
  end
  
  devise_for :users
  resources :users
  
  devise_scope :user do
    get "/login" => "devise/sessions#new"
  end

  match '/privacy' => "home#privacy"
  match '/home' => "home#index"
  match '/home/baseball' => "home#baseball"
  match '/home/basketball' => "home#basketball"
  match '/home/football' => "home#football"
  match '/home/volleyball' => "home#volleyball"
  
  root :to => "home#index"
end