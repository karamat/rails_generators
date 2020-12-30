# frozen_string_literal: true

require 'base_view_generator'

class NewViewGenerator < BaseViewGenerator
  attr_reader :model, :action_name

  source_root File.expand_path('templates', __dir__)
  class_option :model, type: :string

  def create_view_file
    @model = options[:model]
    @action_name = 'new'
    @attributes = allowed_attributes

    filename = filename_with_extensions('new')
    template filename, File.join(generator_dir_path, filename)
    
    filename = filename_with_extensions('_form')
    template filename, File.join(generator_dir_path, filename)
  end
end
