class Comics < ActiveRecord::Migration
  def change
    create_table :comics do |t|
      t.integer :user_id
      t.string :title
      t.integer :published_date
      t.string :summary
      t.string :author
      t.string :illustrator
      t.string :image_url
    end

  end
end
