Rails.application.routes.draw do
  resources :tweets
  get 'load_more_tweets', to: 'tweets#load_more_tweets', as: 'load_more_tweets'
  root 'tweets#index'
end
