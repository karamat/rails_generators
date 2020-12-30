# frozen_string_literal: true

module <%= class_name.pluralize %> 
  class Update
    attr_reader :<%= @model_name.downcase %>, :params

    def initialize(<%= @model_name.downcase %>, params)
      @<%= @model_name.downcase %> = <%= @model_name.downcase %>
      @params = params
    end

    def call
      update_<%= @model_name.downcase %>
    end

    private

      def update_<%= @model_name.downcase %>
        <%= @model_name.downcase %>.update(params)
      end
  end
end
