class Quarter < ActiveRecord::Base
	validates :name, :presence => true
	has_many :sprints, -> { order(:name) }, :dependent => :destroy
	has_many :initiatives, -> { order("priority asc, name asc") }, :dependent => :destroy
end
