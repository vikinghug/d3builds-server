Rails.application.routes.draw do
  resources :builds, only: [:index, :show]
  resources :skill_categories

  resources :classes, as: :klasses, controller: :klasses

  resources :skills
  resources :runes
end
