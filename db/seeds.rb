FavoriteChef.destroy_all
FavoriteDish.destroy_all
FavoriteRestaurant.destroy_all
RestaurantComment.destroy_all
ChefComment.destroy_all
DishComment.destroy_all
Ingredient.destroy_all
Recipe.destroy_all
Dish.destroy_all
Restaurant.destroy_all
RestaurantPhoto.destroy_all
Chef.destroy_all
User.destroy_all



def user_seed
  i = 0
  30.times do
    User.create(name: Faker::Name.unique.name, password: Faker::Number.number(15), username: i.to_s)
    i += 1
  end
end


def add_restaurant_photos(url)
  RestaurantPhoto.create(url: url)
end


def restaurant_seed
  10.times do
    photo = nil
    loop do
      photo = rand(RestaurantPhoto.first.id..RestaurantPhoto.last.id)
      if RestaurantPhoto.exists?(photo)
        break
      end
    end
    Restaurant.create(name: Faker::Restaurant.unique.name, image: RestaurantPhoto.find(photo).url, kind: Faker::Restaurant.unique.type, location: "#{Faker::Address.city}, #{Faker::Address.state_abbr}", popular_dish: "food")
    RestaurantPhoto.destroy(photo)
  end
end


def chef_seed
  i = 0
  20.times do
    Chef.create(name: Faker::FunnyName.three_word_name, image:"https://randomuser.me/api/portraits/women/#{rand(1..99)}.jpg", bio: Faker::Hipster.paragraph(2, false, 4), experience: rand(1..10), restaurant_id: i)
    Chef.create(name: Faker::FunnyName.three_word_name, image:"https://randomuser.me/api/portraits/men/#{rand(1..99)}.jpg", bio: Faker::Hipster.paragraph(2, false, 4), experience: rand(1..10), restaurant_id: i)
    i += 1
  end
end


def get_dishes
  i = 0
  dishes = []
  until i == 50
    page_hash = JSON.parse(RestClient.get("http://www.recipepuppy.com/api/?i=&q=#{i}"))
    i += 1
    page_dishes = page_hash['results']
    page_dishes.each do |dish|
      dishes << dish
    end
  end
  return dishes.flatten(1)
end


def seed_ingredients_recipes_dishes
  get_dishes.each do |dish|
    image = ""
    if dish['thumbnail'] == "" || nil
      image = "https://i.imgur.com/d3xx2bX.jpg"
    else
      image = dish['thumbnail']
    end

    recipe_dish = Dish.create(name: dish['title'], image: image, chef_id: rand(Chef.first.id..Chef.last.id))
    ingredients = dish['ingredients']
    ingredients.split(", ").each do |ingredient|
      recipe_ingredient = Ingredient.find_or_create_by(name: ingredient)
      Recipe.create(ingredient_id: recipe_ingredient.id, dish_id: recipe_dish.id)
    end
  end
end


def fake_user_actions
  User.all.each do |user|
    rand(1..3).times do
      FavoriteRestaurant.create(restaurant_id: rand(Restaurant.first.id..Restaurant.last.id).to_i, user_id: user.id)
    end
    rand(1..4).times do
      FavoriteChef.create(chef_id: rand(Chef.first.id..Chef.last.id), user_id: user.id)
    end
    rand(1..50).times do
      FavoriteDish.create(dish_id: rand(Dish.first.id..Dish.last.id), user_id: user.id)
    end

    rand(1..2).times do
      RestaurantComment.create(restaurant_id: rand(Restaurant.first.id..Restaurant.last.id), user_id: user.id, comment: Faker::Hipster.paragraph(2, false, 4))
    end
    rand(1..2).times do
      ChefComment.create(chef_id: rand(Chef.first.id..Chef.last.id), user_id: user.id, comment: Faker::Hipster.paragraph(2, false, 4))
    end
    rand(1..50).times do
      DishComment.create(dish_id: rand(Dish.first.id..Dish.last.id), user_id: user.id, comment: Faker::Hipster.paragraph(2, false, 4))
    end
  end
end

add_restaurant_photos("https://images.pexels.com/photos/6267/menu-restaurant-vintage-table.jpg?auto=compress&amp;cs=tinysrgb&amp;h=750&amp;w=1260")
add_restaurant_photos("https://images.pexels.com/photos/1064136/pexels-photo-1064136.jpeg?auto=compress&amp;cs=tinysrgb&amp;h=750&amp;w=1260")
add_restaurant_photos("https://images.pexels.com/photos/2755/restaurant.jpg?auto=compress&amp;cs=tinysrgb&amp;h=750&amp;w=1260")
add_restaurant_photos("https://images.pexels.com/photos/262047/pexels-photo-262047.jpeg?auto=compress&amp;cs=tinysrgb&amp;h=750&amp;w=1260")
add_restaurant_photos("https://images.pexels.com/photos/5317/food-salad-restaurant-person.jpg?auto=compress&amp;cs=tinysrgb&amp;h=750&amp;w=1260")
add_restaurant_photos("https://images.pexels.com/photos/941861/pexels-photo-941861.jpeg?auto=compress&amp;cs=tinysrgb&amp;h=750&amp;w=1260")
add_restaurant_photos("https://images.pexels.com/photos/1528013/pexels-photo-1528013.jpeg?auto=compress&amp;cs=tinysrgb&amp;h=750&amp;w=1260")
add_restaurant_photos("https://images.pexels.com/photos/67468/pexels-photo-67468.jpeg?auto=compress&amp;cs=tinysrgb&amp;h=750&amp;w=1260")
add_restaurant_photos("https://images.pexels.com/photos/1115251/pexels-photo-1115251.jpeg?auto=compress&amp;cs=tinysrgb&amp;h=750&amp;w=1260")
add_restaurant_photos("https://images.pexels.com/photos/1477477/pexels-photo-1477477.jpeg?auto=compress&amp;cs=tinysrgb&amp;h=750&amp;w=1260")
add_restaurant_photos("https://images.pexels.com/photos/34650/pexels-photo.jpg?auto=compress&amp;cs=tinysrgb&amp;h=750&amp;w=1260")
add_restaurant_photos("https://images.pexels.com/photos/1395967/pexels-photo-1395967.jpeg?auto=compress&amp;cs=tinysrgb&amp;h=750&amp;w=1260")
add_restaurant_photos("https://images.pexels.com/photos/2159065/pexels-photo-2159065.jpeg?auto=compress&amp;cs=tinysrgb&amp;h=750&amp;w=1260")
add_restaurant_photos("https://images.pexels.com/photos/937505/pexels-photo-937505.jpeg?auto=compress&amp;cs=tinysrgb&amp;h=750&amp;w=1260")
add_restaurant_photos("https://images.pexels.com/photos/914388/pexels-photo-914388.jpeg?auto=compress&amp;cs=tinysrgb&amp;h=750&amp;w=1260")
add_restaurant_photos("https://images.pexels.com/photos/698907/pexels-photo-698907.jpeg?auto=compress&amp;cs=tinysrgb&amp;h=750&amp;w=1260")
add_restaurant_photos("https://images.pexels.com/photos/827528/pexels-photo-827528.jpeg?auto=compress&amp;cs=tinysrgb&amp;h=750&amp;w=1260")
add_restaurant_photos("https://images.pexels.com/photos/903376/pexels-photo-903376.jpeg?auto=compress&amp;cs=tinysrgb&amp;h=750&amp;w=1260")
add_restaurant_photos("https://images.pexels.com/photos/1449773/pexels-photo-1449773.jpeg?auto=compress&amp;cs=tinysrgb&amp;h=750&amp;w=1260")
add_restaurant_photos("https://images.pexels.com/photos/1724199/pexels-photo-1724199.jpeg?auto=compress&amp;cs=tinysrgb&amp;h=750&amp;w=1260")

user_seed
restaurant_seed
chef_seed
seed_ingredients_recipes_dishes
fake_user_actions
