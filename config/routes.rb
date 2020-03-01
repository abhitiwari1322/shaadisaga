Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :news do
    collection  do
      get :my_news
      get :all_news
      post :mark_as_read
      post :mark_as_delete
           
    end
  end
  # resources :user_news do
  #   collection do
  #     post :create
  #   end
  # end
end
