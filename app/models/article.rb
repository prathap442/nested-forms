class Article < ApplicationRecord
	mount_uploader :cover, CoverUploader
	belongs_to :category
	has_many :comments
	accepts_nested_attributes_for :comments
	belongs_to :user
	extend FriendlyId
  	friendly_id :title, use: [:slugged, :finders]
	validates_presence_of :title, :body, :category_id, :published_date, :user_id
	validate :published_date_within_one_month_from_now

	def published_date_within_one_month_from_now
		if published_date > Date.today + 30
			errors.add(:published_date, "can't be valid")
		end
	end

	def cached_comments_count
		Rails.cache.fetch([self, "comments_count"]) { comments.size }
	end
end
