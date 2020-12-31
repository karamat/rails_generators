# frozen_string_literal: true

class <%= class_name %>Controller < ApplicationController
  before_action :authenticate_user!

  def create
    @<%= model.underscore %> = <%= class_name %>::Create.new(<%= model.underscore %>_params).call
    if @<%= model.underscore %>.valid? && @<%= model.underscore %>.persisted?
      redirect_to @<%= model.underscore %>, notice: '<%= model %> was successfully created'
    else
      render :new
    end
  end
end
