class User < ApplicationRecord
	validates :email , presence: true, uniqueness: true
	def self.search(query)
		str = "%#{query}%"
   	where("firstName like ? OR email = ? OR lastName= ?", str,str,str).pluck(:firstName, :lastName).map{|user| user.join(" ") }
	end

end
