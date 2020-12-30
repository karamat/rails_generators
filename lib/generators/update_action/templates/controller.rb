# frozen_string_literal: true

class <%= class_name %>Controller < ApplicationController
  before_action :authenticate_user!

  def update
    @<%= @model.downcase %> = <%= class_name %>::Update.new(params).call
  end
  def update
    success = <%= class_name %>::Update.new(@<%= model.downcase %>, <%= model.downcase %>_params).call
    if success
      redirect_to(@<%= model.downcase %>, notice: '<%= model %> was successfully updated')
    else
      render :edit
    end
  end
end
