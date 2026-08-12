class Ability
  include CanCan::Ability

  def initialize(user)
    if user.provider?
      can :create_working_hours, Service
    # elsif user.customer?  
      # can :view_slots, 
      # can :book_appointment
    # elsif user.admin?
    end
  end
end
