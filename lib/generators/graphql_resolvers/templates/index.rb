# frozen_string_literal: true

module Resolvers
  module <%= class_name.pluralize %>
    # Resolver to return a <%= class_name.pluralize %>
    class <%= class_name.pluralize %> < Resolvers::BaseResolver
      include ::SearchObject.module(:graphql)

      type [Types::<%= class_name.pluralize %>::<%= class_name %>Type], null: false
      description 'Returns all <%= class_name.pluralize %>'
      scope { resources }

      def resources
        ::<%= class_name %>.all
      end

      option :order_by, type: Types::ItemOrderType, with: :apply_order_by
      def allowed_order_attributes
        %w[name]
      end

      # inline input type definition for the advanced filter
      class <%= class_name %>FilterType < ::Types::BaseInputObject
        argument :OR, [self], required: false
        argument :name, String, required: false
      end
      option :filter, type: <%= class_name %>FilterType, with: :apply_filter
      def allowed_filter_attributes
        %w[name]
      end
    end
  end
end
