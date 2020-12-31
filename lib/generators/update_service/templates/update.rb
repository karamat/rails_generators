# frozen_string_literal: true

module <%= class_name.pluralize %> 
  class Update
    attr_reader :<%= @model_name.underscore %>, :params

    def initialize(<%= @model_name.underscore %>, params)
      @<%= @model_name.underscore %> = <%= @model_name.underscore %>
      @params = params
    end

    def call
      update_<%= @model_name.underscore %>
    end

    private

      def update_<%= @model_name.underscore %>
        <%= @model_name.underscore %>.update(params)
      end
  end
end
