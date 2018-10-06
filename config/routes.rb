Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/foods', to: 'foods#index'
      get '/foods/:food_id', to: 'foods#show'
      post '/foods', to: 'foods#create'
      patch '/foods/:food_id', to: 'foods#update'
      delete '/foods/:food_id', to: 'foods#destroy'

      get '/meals', to: 'meals#index'
      get '/meals/:meal_id/foods', to: 'meals#show'
      post '/meals/:meal_id/foods/:food_id', to: 'meal_foods#create'
      delete '/meals/:meal_id/foods/:food_id', to: 'meal_foods#destroy'

      get '/favorite_foods', to: 'favorite_foods#index'
    end
  end
end
