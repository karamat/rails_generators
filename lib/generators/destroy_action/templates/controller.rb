# frozen_string_literal: true

class <%= class_name %>Controller < ApplicationController
  before_action :authenticate_user!

  def destroy
    redirect_to(<%= class_name.pluralize.downcase %>_path, notice: '<%= model %> not found') and return if @<%= model.downcase %>.nil?
    <%= class_name.titleize %>::Destroy.new(@<%= model.downcase %>).call
    redirect_to(<%= class_name.pluralize.downcase %>_path, notice: '<%= model %> was successfully destroyed.')
  end
end
