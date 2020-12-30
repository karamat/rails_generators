# frozen_string_literal: true

require 'base_view_generator'

class IndexViewGenerator < BaseViewGenerator
  attr_reader :model, :action_name

  source_root File.expand_path('templates', __dir__)
  class_option :model, type: :string

  def create_view_file
    @model = options[:model]
    @action_name = 'index'
    @attributes = allowed_attributes

    filename = filename_with_extensions('index')
    template filename, File.join(generator_dir_path, filename)
  end
end
