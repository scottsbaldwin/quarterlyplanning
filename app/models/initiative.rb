class Initiative < ActiveRecord::Base
	validates :name, :presence => true
	validates :priority, :numericality => { :greater_than_or_equal_to => 0, :only_integer => true }
 
	belongs_to :quarter
end
