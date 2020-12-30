# frozen_string_literal: true

require 'base_view_generator'

class ShowViewGenerator < BaseViewGenerator
  attr_reader :model, :action_name

  source_root File.expand_path('templates', __dir__)
  class_option :model, type: :string

  def create_view_file
    @model = options[:model]
    @action_name = 'show'
    @attributes = allowed_attributes

    filename = filename_with_extensions('show')
    template filename, File.join(generator_dir_path, filename)
  end
end
