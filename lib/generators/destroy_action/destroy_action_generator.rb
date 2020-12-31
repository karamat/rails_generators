# frozen_string_literal: true

require 'base_controller_generator'

class DestroyActionGenerator < BaseControllerGenerator
  attr_reader :model, :action_name

  source_root File.expand_path('templates', __dir__)
  
  def ask_model_name
    @model = ask("Which model? [#{model_name}]")
    @model = model_name if @model.blank?
  end

  def create_action_file
    @action_name = 'destroy'
    if File.exists?(file_path)
      unless action_exists?
        inject_into_file file_path, after: /before_action.*\n(\s*before_action.*\n)*/, force: true do
<<-RUBY

  def destroy
    redirect_to(#{class_name.pluralize.underscore}_path, notice: '#{model} not found') and return if @#{model.underscore}.nil?
    #{class_name}::Destroy.new(@#{model.underscore}).call
    redirect_to(#{class_name.pluralize.underscore}_path, notice: '#{model} was successfully destroyed.')
  end
RUBY
        end
      end
    else
      template "controller.rb", file_path
    end
  end

  def generate_service_file
    generate "destroy_service", "#{class_name} --model=#{model}"
  end
end
