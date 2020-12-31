# frozen_string_literal: true

class <%= class_name %>Controller < ApplicationController
  before_action :authenticate_user!

  def destroy
    redirect_to(<%= class_name.pluralize.underscore %>_path, notice: '<%= model %> not found') and return if @<%= model.underscore %>.nil?
    <%= class_name %>::Destroy.new(@<%= model.underscore %>).call
    redirect_to(<%= class_name.pluralize.underscore %>_path, notice: '<%= model %> was successfully destroyed.')
  end
end
