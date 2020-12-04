class Comics < ActiveRecord::Migration
  def change
    create_table :comics do |t|
      t.string :title
      t.integer :published
      t.string :author
      t.string :illustrator
      t.text :summary
    end

  end
end
