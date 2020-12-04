class AddUserIdToComics < ActiveRecord::Migration
  def change
    add_reference :comics, :user, foreign_key: true
  end
end
