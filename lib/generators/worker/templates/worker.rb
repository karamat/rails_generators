# frozen_string_literal: true

class <%= class_name %>Worker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform
    
  end
end
