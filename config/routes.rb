Rails.application.routes.draw do

  namespace :api do

  end

  scope :module => :web do
    root to: 'addresses#index'

    #resources :addresses
  end

end
