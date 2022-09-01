Rails.application.routes.draw do
  devise_for :users,
  controllers: { registrations: 'registrations' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#index'

  # ここにusersコントローラーのshowアクションのルーティングを追加する
  get '/users/:id', to: 'users#show', as: 'user'
  
  # resourcesメソッドは以下の7つのアクションのルーティングを自動で生成
  resources :posts, only: %i(index new create show destroy) do
    resources :photos, only: %i(create)
    resources :likes, only: %i(create destroy)
  # ルーティングをネスト（入れ子）にすることで、親子関係をルーティングで表すことができる。commentsに関してはpostsに対して「子」の関係になるので、ネストすることで、どの投稿に紐づくかを明示  
    resources :comments, only: %i(create destroy)
    resources :maps
  end
  #onlyを使うと、自動で生成される7つのアクションのうちどのアクションのルーティングを追加するか絞り込むことができる

end                                                