class Ability
	include CanCan::Ability

	def initialize(user)
		user ||= User.new 
		if user.email?
			can [:create], List
			can :manage, List do |list|
				list.user_id == user.id
			end

		end
	end
end
