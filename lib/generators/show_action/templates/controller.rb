# frozen_string_literal: true

class <%= class_name %>Controller < ApplicationController
  before_action :authenticate_user!

  def show
    redirect_to(<%= model.pluralize.downcase %>_path, notice: '<%= model %> not found') if @<%= model.downcase %>.nil?
  end
end
