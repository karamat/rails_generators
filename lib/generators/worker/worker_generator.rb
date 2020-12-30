# frozen_string_literal: true

class WorkerGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('templates', __dir__)

  class_option :module, type: :string

  def create_api_file
    @module_name = options[:module]

    api_dir_path = 'app/workers'
    generator_dir_path = api_dir_path + ("/#{@module_name.underscore}" if @module_name.present?).to_s
    generator_path = generator_dir_path + "/#{file_name}_worker.rb"

    Dir.mkdir(api_dir_path) unless File.exist?(api_dir_path)
    Dir.mkdir(generator_dir_path) unless File.exist?(generator_dir_path)

    if @module_name.present?
      template 'worker_with_module.rb', generator_path
      puts ''"
Use this code snippet to call this worker:

#{@module_name.camelize}::#{class_name}Worker.perform_async()

      "''
    else
      template 'worker.rb', generator_path
      puts ''"
Use this code snippet to call this worker:

#{class_name}Worker.perform_async()

      "''
    end
  end
end
