# frozen_string_literal: true

<% if @module_name.present? %>module <%= @module_name.camelize %><% end %>
  class <%= class_name %>Worker
    include Sidekiq::Worker
    sidekiq_options retry: false

    def perform
      
    end
  end
<% if @module_name.present? %>end<% end %>
