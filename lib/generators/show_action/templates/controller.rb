# frozen_string_literal: true

class <%= class_name %>Controller < ApplicationController
  before_action :authenticate_user!

  def show
    redirect_to(<%= model.pluralize.underscore %>_path, notice: '<%= model %> not found') if @<%= model.underscore %>.nil?
  end
end
