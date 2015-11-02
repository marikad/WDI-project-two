class Ability
	include CanCan::Ability

	def initialize(user)
		user ||= User.new 
		if user.email?
			can :read, :all
		end
	end
end
