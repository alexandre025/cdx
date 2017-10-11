module Cdx
  class Ability
    include CanCan::Ability

    class_attribute :abilities
    self.abilities = Set.new

    def self.register_ability(ability)
      abilities.add(ability)
    end

    def self.remove_ability(ability)
      abilities.delete(ability)
    end

    def initialize(user, controller_namespace, current_site = Site.current)
      clear_aliased_actions

      if controller_namespace == 'Cdx::Admin'

        if user.is_admin?
          can :manage, :all
        end

      else

      end

      Ability.abilities.merge(abilities_to_register).each do |clazz|
        merge clazz.new(user, controller_namespace, current_site)
      end
    end

    private

      def abilities_to_register
        []
      end
  end
end
