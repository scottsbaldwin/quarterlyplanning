class Planitem < ActiveRecord::Base
	validates :description, :presence => true
	belongs_to :team
	belongs_to :initiative
	belongs_to :sprint
end
