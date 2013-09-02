class Post < ActiveRecord::Base
  validates_presence_of :title, :content
	attr_accessible :title, :content
  searchable do
    text :title
  end
end