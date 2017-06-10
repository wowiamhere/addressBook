Rails.application.routes.draw do

  devise_for :users, controllers: { sessions: 'users/sessions' }

  devise_scope :user do 
    root to: "users/sessions#new"
  end

end
