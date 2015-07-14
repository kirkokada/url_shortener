Rails.application.routes.draw do
 root 'links#new'

 get '/:slug' => 'links#redirect'

 resources :links
end
