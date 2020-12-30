# frozen_string_literal: true

module <%= class_name.pluralize %> 
  class Create
    attr_reader :params

    def initialize(params)
      @params = params
    end

    def call
      <%= @model_name %>.create(params)
    end
  end
end
