# frozen_string_literal: true

class <%= class_name %>Controller < ApplicationController
  before_action :authenticate_user!

  def index
    @<%= @model.pluralize.downcase %> = <%= class_name %>::List.new(params).call
  end
end
