# frozen_string_literal: true

module <%= class_name.pluralize.titleize %> 
  class Destroy
    attr_reader :<%= model_name.downcase %>

    def initialize(<%= model_name.downcase %>)
      @<%= model_name.downcase %> = <%= model_name.downcase %>
    end

    def call
      <%= model_name.downcase %>.destroy
    end
  end
end
