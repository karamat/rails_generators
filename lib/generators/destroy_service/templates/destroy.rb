# frozen_string_literal: true

module <%= class_name %> 
  class Destroy
    attr_reader :<%= model_name.underscore %>

    def initialize(<%= model_name.underscore %>)
      @<%= model_name.underscore %> = <%= model_name.underscore %>
    end

    def call
      <%= model_name.underscore %>.destroy
    end
  end
end
