# frozen_string_literal: true

require 'base_controller_generator'

class NewActionGenerator < BaseControllerGenerator
  attr_reader :model, :action_name

  source_root File.expand_path('templates', __dir__)
  
  def ask_model_name
    @model = ask("Which model? [#{model_name}]")
    @model = model_name if @model.blank?
  end

  def create_action_file
    @action_name = 'new'

    if File.exists?(file_path)
      unless action_exists?
        inject_into_file file_path, after: /before_action.*\n(\s*before_action.*\n)*/, force: true do
<<-RUBY

  def new
    @#{model.underscore} = #{model}.new
  end
RUBY
        end
      end
    else
      template "controller.rb", file_path
    end
  end

  def create_view_file
    generate "new_view", "#{class_name} --model=#{model}"
  end
end
