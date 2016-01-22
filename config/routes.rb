Rails.application.routes.draw do
  resources :skill_categories
  resources :skill_categories

  resources :classes, as: :klasses, controller: :klasses do
    resources :skill_categories, only: [:index]
    resources :passive_skills, only: [:index, :show]
    resources :skills, only: [:index, :show] do
      resources :runes, only: [:index, :show]
    end
  end

  resources :skills
  resources :runes
end
