# frozen_string_literal: true

require 'rails/generators'

class BaseControllerGenerator < Rails::Generators::NamedBase
  protected
    def file_path
      File.join('app/controllers', "#{class_name.underscore}_controller.rb")
    end

    def action_exists?
      methods = controller_class.action_methods

      if methods.include? action_name
        puts "#{controller_class} has already #{action_name} method"
        return true
      end
      false
    end

    def controller_class
      "#{class_name}Controller".constantize
    end

    def model_name
      class_name.pluralize.singularize
    end

    def model_attributes
      model.constantize.columns.map do |column|
        { name: column.name, field_type: column.type }
      end
    end
  
    def allowed_attributes
      model_attributes.delete_if do |column|
        !!column[:name].to_s.match(/id|created_at|updated_at/)
      end
    end
end