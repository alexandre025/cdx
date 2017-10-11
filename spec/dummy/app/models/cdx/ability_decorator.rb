module Cdx
  class AbilityDecorator
    include CanCan::Ability

    # Exemple of ability decorator

    def initialize(user, controller_namespace, current_site = Site.current)
      if controller_namespace == 'Cdx::Admin'

      end
    end
  end
end

Cdx::Ability.register_ability(Cdx::AbilityDecorator)