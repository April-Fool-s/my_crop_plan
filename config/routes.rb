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

  devise_scope :user do
    post "users/guest_sign_in", to: "public/sessions#guest_sign_in"
  end

  scope module: :public do
    root to: 'homes#top'
    resources :users, only: [:update] do
      collection do
        get 'mypage/edit' => 'users#edit'
        patch 'close_account'
        get "check_name"
        get "check_email"
        post 'check_user'
      end
    end
    resources :crops
    resources :fields do
      collection do
        get "field_section_list"
      end
    end
    resources :plans do
      collection do
        get "plan_index"
      end
    end
  end
end