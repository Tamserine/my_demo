# frozen_string_literal: true

Rails.application.routes.draw do
  # get 'welcome/index'
  # root to: 'welcome#index'

  root 'articles#index'
  get '/articles', to: 'articles#index'
  post '/articles/:id/toggle', to: 'articles#toggle_favorite'
end
