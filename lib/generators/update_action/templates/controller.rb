# frozen_string_literal: true

class <%= class_name %>Controller < ApplicationController
  before_action :authenticate_user!

  def update
    @<%= @model.underscore %> = <%= class_name %>::Update.new(params).call
  end
  def update
    success = <%= class_name %>::Update.new(@<%= model.underscore %>, <%= model.underscore %>_params).call
    if success
      redirect_to(@<%= model.underscore %>, notice: '<%= model %> was successfully updated')
    else
      render :edit
    end
  end
end
