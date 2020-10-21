Rails.application.routes.draw do
  get 'stats/index'

  post 'refresh', to: 'stats#refresh'
  post 'clear', to: 'stats#clear'
  get 'progress', to: 'stats#progress'

  root 'stats#index'
end
