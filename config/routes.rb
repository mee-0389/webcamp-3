Rails.application.routes.draw do
  get 'lists/new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post 'lists' => 'lists#create' #データを追加(保存)するためのルーティング
  get 'lists' => 'lists#index'
  get 'lists/:id' => 'lists#show', as: 'list' #コロンはurlを指定
  get 'lists/:id/edit' => 'lists#edit', as: 'edit_list'
  patch 'lists/:id' => 'lists#update', as: 'update_list'
  get '/top' => 'homes#top'
end