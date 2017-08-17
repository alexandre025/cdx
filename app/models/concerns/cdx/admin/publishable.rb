module Cdx
  module Admin
    module Publishable
      extend ActiveSupport::Concern

      included do
        # State Machine
        state_machine initial: :draft do

          state :draft do

          end

          state :published do
            validates :published_on, presence: true
          end

          event :publish do
            transition draft: :published
          end

          event :unpublish do
            transition published: :draft
          end

          before_transition to: :published do |object, transition|
            object.published_on = DateTime.current
          end

        end
      end
    end
  end
end
