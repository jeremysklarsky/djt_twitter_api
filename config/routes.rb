Rails.application.routes.draw do
  resources :words, :hashtags, :mentions, only: [:index, :show] do
    collection do
      get "stats"
    end
  end

  resources :tweets, only: [:index, :show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
