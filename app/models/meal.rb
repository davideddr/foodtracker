class Meal < ActiveRecord::Base
	belongs_to :user
	has_many :foods, :dependent => :destroy
	accepts_nested_attributes_for :foods, :allow_destroy => true

	validates :name, presence: true, inclusion: { in: %w(breakfast lunch dinner snack)}
	NAME= [ :breakfast, :lunch, :dinner, :snack ].freeze
end
