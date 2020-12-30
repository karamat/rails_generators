# frozen_string_literal: true

module <%= class_name.pluralize %> 
  class List
    attr_reader :params

    def initialize(params)
      @params = params
    end

    def call
      <%= @model_name %>.all
    end
  end
end
