# frozen_string_literal: true

module Mutations
  module <%= class_name.pluralize %>
    class Delete<%= class_name %> < BaseMutation
      type Types::<%= class_name.pluralize %>::<%= class_name %>Type, null: true

      argument :id, ID, required: true

      def resolve(id:)
        ::<%= class_name %>.find(id).destroy
      end
    end
  end
end
