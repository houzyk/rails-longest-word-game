Rails.application.routes.draw do
  get 'new', to: 'games#new', as: :new
  post 'score', to: 'games#score'
end

Rails.application.config.session_store :cookie_store, key: '1234'
