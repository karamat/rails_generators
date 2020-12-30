# frozen_string_literal: true

class ApiGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('templates', __dir__)

  class_option :module, type: :string

  def create_api_file
    @module_name = options[:module]

    api_dir_path = 'app/controllers/api/v1'
    generator_dir_path = api_dir_path + ("/#{@module_name.underscore}" if @module_name.present?).to_s
    generator_path = generator_dir_path + "/#{file_name.pluralize}_controller.rb"

    Dir.mkdir(api_dir_path) unless File.exist?(api_dir_path)
    Dir.mkdir(generator_dir_path) unless File.exist?(generator_dir_path)

    template 'api.rb', generator_path
  end
end
