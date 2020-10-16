Rails.application.routes.draw do
  get 'stats/index'

  post 'refresh', to: 'stats#refresh'
  post 'clear', to: 'stats#clear'

  root 'stats#index'
end
