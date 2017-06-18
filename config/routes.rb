Rails.application.routes.draw do

    # - from rails g scaffold
  resources :contacts

    # - configuring after generating DEVISE's controllers 
  devise_for :users, controllers: { sessions: 'users/sessions' }

    # - setting DEVISE's login/Register view as root
  devise_scope :user do 
    root to: "users/sessions#new"
  end

    # - soft delete
    # - user clicks check box at app/views/contacts/index
    # - User.deactivate toggled true/false
    # - User.deactivated = true 
    #   + displayed in side bar
  post '/deactivate_contact' => 'contacts#deactivate_contact'
  post '/reactivate_contact' => 'contacts#reactivate_contact'


end
