# frozen_string_literal: true

require 'rails/generators'

class BaseViewGenerator < Rails::Generators::NamedBase
  protected
    def file_path
      File.join(generator_dir_path, "update.rb")
    end

    def generator_dir_path
      dir_path = base_path + ("/#{class_name.underscore}" if class_name.present?).to_s
      ensure_dir_exists(dir_path)
      dir_path
    end

    def base_path
      dir_path = 'app/views'
      ensure_dir_exists(dir_path)
      dir_path
    end
    
    def ensure_dir_exists(dir_path)
      Dir.mkdir(dir_path) unless File.exist?(dir_path)
    end

    def formats
      [format]
    end

    def format
      :html
    end

    def handler
      :slim
    end

    def filename_with_extensions(name, file_format = format)
      [name, file_format, handler].compact.join(".")
    end

    def model_attributes
      model.constantize.columns.map do |column|
        { name: column.name, field_type: column.type }
      end
    end
  
    def allowed_attributes
      model_attributes.delete_if do |column|
        !!column[:name].to_s.match(/created_at|updated_at/)
      end
    end
end