Rails.application.routes.draw do
  root 'myurls#index'

  get ':key' => 'myurls#redirect'


  match ':controller(/:action(/:id))' , :via => [:get, :post]
end
