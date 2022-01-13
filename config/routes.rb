Rails.application.routes.draw do
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    resources :users, only: [:create, :show, :new]
    resources :psychiatrists, only: [:create, :show, :new]

    get "/users/:id/findhelp", to: "users#findhelp"
end
