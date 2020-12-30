# frozen_string_literal: true

require 'rails/generators'

class BaseControllerGenerator < Rails::Generators::NamedBase
  protected
    def file_path
      File.join(Config::PROJECT_PATH, 'app/controllers', "#{class_name.underscore}_controller.rb")
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
      "#{class_name.underscore.titleize}Controller".constantize
    end

    def model_name
      class_name.pluralize.singularize
    end
end