class Food < ActiveRecord::Base
	belongs_to :meal

	validates :name, presence: true
	validates :quantity, presence: true, length: { in: 1..100 }
	validates :units, presence: true, inclusion: { in: %w(grams hectograms kilograms)}
	UNITS= [ :grams, :hectograms, :kilograms ].freeze
end
