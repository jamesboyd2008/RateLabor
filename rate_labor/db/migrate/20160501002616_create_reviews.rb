class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :content
      # t.references :reviewable, polymorphic: true, index: true
      t.integer :reviewable_id
      t.string :reviewable_type
      t.timestamps null: false
    end

    add_index :reviews, :reviewable_id
  end
end

# class CreatePictures < ActiveRecord::Migration
#   def change
#     create_table :pictures do |t|
#       t.string  :name
#       t.integer :imageable_id
#       t.string  :imageable_type
#       t.timestamps null: false
#     end
#
#     add_index :pictures, :imageable_id
#   end
# end
