class CreateRestaurantPhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurant_photos do |t|
      t.string :url
    end
  end
end
