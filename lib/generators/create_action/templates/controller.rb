# frozen_string_literal: true

class <%= class_name %>Controller < ApplicationController
  before_action :authenticate_user!

  def create
    @<%= model.downcase %> = <%= class_name %>::Create.new(<%= model.downcase %>_params).call
    if @<%= model.downcase %>.valid? && @<%= model.downcase %>.persisted?
      redirect_to @<%= model.downcase %>, notice: '<%= model %> was successfully created'
    else
      render :new
    end
  end
end
