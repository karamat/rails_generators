# frozen_string_literal: true

require 'base_controller_generator'

class MyControllerGenerator < BaseControllerGenerator
  attr_reader :model

  source_root File.expand_path('templates', __dir__)
  argument :actions, type: :array, default: [], banner: "action action"

  def ask_model_name
    @model = ask("Which model? [#{model_name}]")
    @model = model_name if @model.blank?
  end

  def create_controller_files
    template "controller.rb", File.join("app/controllers", class_path, "#{file_name}_controller.rb")
  end

  def create_actions
    actions.each do |action|
      @action = action
      if default_action? action
        generate "#{action}_action", "#{class_name}"
      else
        generate 'controller_action', "#{class_name} #{action}"
      end
    end
  end

  private
    def file_name
      @_file_name ||= remove_possible_suffix(super)
    end

    def remove_possible_suffix(name)
      name.sub(/_?controller$/i, "")
    end

    def default_actions
      %w(index show new create edit update destroy)
    end

    def default_action?(action)
      default_actions.include? action
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

    def skip_view?(action)
      %w(create update destroy).include? action
    end

    def skip_service?(action)
      %w(new edit).include? action
    end
end
