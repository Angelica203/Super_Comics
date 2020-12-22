class Comic < ActiveRecord::Base
    belongs_to :user
    validates :title, :published, :author, :illustrator, :summary, presence: true
end