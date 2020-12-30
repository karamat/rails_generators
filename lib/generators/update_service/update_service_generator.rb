# frozen_string_literal: true

class UpdateServiceGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('templates', __dir__)
  class_option :model, type: :string

  def create_update_service_file
    @model_name = options[:model]
    template "update.rb", file_path
  end

  private

    def file_path
      File.join(generator_dir_path, "update.rb")
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