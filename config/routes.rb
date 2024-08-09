Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # ユーザー用　URL/users/sign_in...
  devise_for :users, controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions',
  }

  # 管理者用　URL/admin/sign_in...
  devise_for :admin, controllers: {
    sessions: 'admin/sessions'
  }

  scope module: :public do
    root to: 'homes#top'
    get 'users/mypage/edit' => 'users#edit'
    patch 'users/mypage' => 'users#update'
    get 'users/confirm' => 'users#confirm'
    patch 'users/close_account' => 'users#close_account'
  end

end