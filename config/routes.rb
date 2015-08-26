Rails.application.routes.draw do

  root 'ideas#index'

  resources :ideas do
    member do
      get "upvote", to: 'ideas#thumbs_up'
      get "downvote", to: 'ideas#thumbs_down'
    end
  end

end
