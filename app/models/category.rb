class Category < ApplicationRecord
	has_many :articles
	accepts_nested_attributes_for :articles
	
	validates_presence_of :name, :description
	validates_uniqueness_of :name
	validates_length_of :description, minimum: 5
end
