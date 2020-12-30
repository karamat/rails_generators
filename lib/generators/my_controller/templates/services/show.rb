# frozen_string_literal: true

module <%= class_name.pluralize %> 
  class Show
    attr_reader :params

    def initialize(params)
      @params = params
    end

    def call; end
  end
end
