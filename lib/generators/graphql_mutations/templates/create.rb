# frozen_string_literal: true

module Mutations
  module <%= class_name.pluralize %>
    class Create<%= class_name %> < BaseMutation
      type Types::<%= class_name.pluralize %>::<%= class_name %>Type, null: true

      argument :attributes, Types::<%= class_name.pluralize %>::<%= class_name %>Attributes, required: false

      def resolve(attributes:)
        ::<%= class_name %>.create!(
          attributes.as_json
        )
      end
    end
  end
end
