# frozen_string_literal: true

class ServiceGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)

  argument :methods, type: :array, default: [], banner: "method method"
  class_option :module, type: :string

  def create_service_file
    @module_name = options[:module]
    template "service.erb", file_path
  end

  private
    def file_path
      File.join(generator_dir_path, "destroy.rb")
    end

    def generator_dir_path
      dir_path = base_path + ("/#{class_name.underscore}" if class_name.present?).to_s
      ensure_dir_exists(dir_path)
      dir_path
    end

    def base_path
      dir_path = 'app/services'
      ensure_dir_exists(dir_path)
      dir_path
    end
    
    def ensure_dir_exists(dir_path)
      Dir.mkdir(dir_path) unless File.exist?(dir_path)
    end
end
