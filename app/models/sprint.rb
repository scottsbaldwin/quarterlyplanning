class Sprint < ActiveRecord::Base
	validates :name, :presence => true
	belongs_to :quarter
end
