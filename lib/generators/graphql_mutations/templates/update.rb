# frozen_string_literal: true

module Mutations
  module <%= class_name.pluralize %>
    class Update<%= class_name %> < BaseMutation
      type Types::<%= class_name.pluralize %>::<%= class_name %>Type, null: true

      argument :id, ID, required: true
      argument :attributes, Types::<%= class_name.pluralize %>::<%= class_name %>Attributes, required: false

      def resolve(id:, attributes:)
        <%= class_name.underscore %> = ::<%= class_name %>.find_by_id(id)
        <%= class_name.underscore %>.update(attributes.as_json)
        <%= class_name.underscore %>
      end
    end
  end
end
