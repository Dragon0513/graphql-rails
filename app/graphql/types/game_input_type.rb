# frozen_string_literal: true

module Types
  class GameInputType < Types::BaseInputObject
    description "Attributes to create a game."
    argument :title, String, required: true
    argument :description, String, required: false
    argument :platform_ids, [ID], required: false
  end
end
