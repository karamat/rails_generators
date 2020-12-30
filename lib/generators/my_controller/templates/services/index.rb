# frozen_string_literal: true

module <%= class_name.pluralize %> 
  class Index
    attr_reader :params

    def initialize(params)
      @params = params
    end

    def call
      <%= @model %>.all
    end
  end
end
