# frozen_string_literal: true

class <%= class_name %>Controller < ApplicationController
  before_action :authenticate_user!

  def new
    @<%= @model.downcase %> = <%= @model %>.new
  end
end
