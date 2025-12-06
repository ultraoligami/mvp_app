Rails.application.routes.draw do
  # 不要 → stamps の get ルートは削除
  # get "stamps/create"
  # get "stamps/update"
  # get "stamps/destroy"

  get "contacts/new"
  get "contacts/create"
  get "contacts/thanks"

  get "static_pages/terms"
  get "static_pages/privacy"

  get "terms", to: "static_pages#terms"
  get "privacy", to: "static_pages#privacy"

  post "ai/humor", to: "ai#humor"

  devise_for :users

  devise_scope :user do
    get "users/sign_out", to: "devise/sessions#destroy"
  end

  # ▼ スプラッシュ
  root "pages#splash"
  get "/home", to: "pages#home"

  # ▼ Posts のルーティング
  resources :posts do
    collection do
      get :mypage
      get :calendar
    end

    # ▼ Stamps を Posts にネスト（これが正しい）
    resources :stamps, only: [:create, :destroy]
  end
end