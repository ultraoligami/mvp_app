Rails.application.routes.draw do
  get "contacts/new"
  get "contacts/create"
  get "contacts/thanks"
  get "static_pages/terms"
  get "static_pages/privacy"
  get "posts/index"
  get "posts/show"
  get "posts/new"
  get "posts/create"
  get "posts/edit"
  get "posts/update"
  get "posts/destroy"
  get "terms", to: "static_pages#terms"
  get "privacy", to: "static_pages#privacy"

  post "ai/humor", to: "ai#humor"

  devise_for :users

  # GETログアウトを許可（Turbo問題の回避）
  devise_scope :user do
    get "users/sign_out", to: "devise/sessions#destroy"
  end


  # 最初にスプラッシュを表示
  root "pages#splash"

  # スプラッシュ後に遷移する本来のホーム
  get "/home", to: "pages#home"

  # ★ここにマイページルートを追加
  resources :posts do
    collection do
      get :mypage   # ← 自分の投稿一覧表示用
      get :calendar
    end
  end
end