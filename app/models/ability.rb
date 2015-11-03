class Ability
	include CanCan::Ability

	def initialize(user)
		user ||= User.new 
		if user.role == "admin"
			can :manage, :all 
		elsif user.role == "user"
			can :create, List
			can :read, List
			can :manage, List do |list|
				list.user_id == user.id
			end
		else 
			can :read, :all
		end
	end
end
