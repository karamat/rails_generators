# frozen_string_literal: true

class <%= class_name %>Controller < ApplicationController
  before_action :authenticate_user!

  def <%= action_name %>
  end
end