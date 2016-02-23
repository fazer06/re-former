# == Route Map
#
# You don't have any routes defined!
#
# Please add some routes in config/routes.rb.
#
# For more information about routes, see the Rails guide: http://guides.rubyonrails.org/routing.html.
#

Rails.application.routes.draw do

  resources :users, :only => [:new, :create, :edit, :update]

end
