# frozen_string_literal: true

module Resolvers
  module <%= class_name.pluralize %>
    # Resolver to return a <%= class_name %>
    class <%= class_name %> < Resolvers::BaseResolver
      type Types::<%= class_name.pluralize %>::<%= class_name %>Type, null: true
      description 'Returns the <%= class_name %> for a requested id'

      argument :id, ID, required: true

      def resolve(id:)
        ::<%= class_name %>.find_by(id:)
      end
    end
  end
end
