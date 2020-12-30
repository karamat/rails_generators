# frozen_string_literal: true

module Api
  module V1
    <% if @module_name.present? %>module <%= @module_name.camelize %>  <% end %>
      class <%= class_name.pluralize %>Controller < ApplicationController
        before_action :authenticate_user!

        def index
          render json: <%= class_name %>.all
        end
      end
    <% if @module_name.present? %>end <% end %>
  end
end
