Rails.application.routes.draw do
  resource :kitten
  root to: 'kittens#index'
end
