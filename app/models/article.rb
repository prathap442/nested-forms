class Article < ApplicationRecord
	mount_uploader :cover, CoverUploader
	belongs_to :category
	has_many :comments
	belongs_to :user
	extend FriendlyId
  	friendly_id :title, use: [:slugged, :finders]
	validates_presence_of :title, :body, :category_id, :published_date, :cover, :user_id
	validates_length_of :body, minimum: 10
	validate :published_date_within_one_month_from_now

	def published_date_within_one_month_from_now
		if published_date > Date.today + 30
			errors.add(:published_date, "can't be valid")
		end
	end
end
