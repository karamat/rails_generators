# frozen_string_literal: true

class <%= class_name %>Controller < ApplicationController
  before_action :authenticate_user!

  def new
    @<%= @model.underscore %> = <%= @model %>.new
  end
end
