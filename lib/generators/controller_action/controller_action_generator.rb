# frozen_string_literal: true

require 'base_controller_generator'

class ControllerActionGenerator < BaseControllerGenerator
  source_root File.expand_path('templates', __dir__)
  argument :action_name, type: :string, default: 'index', banner: "action"

  def create_action_file
    if File.exists?(file_path)
      unless action_exists?
        inject_into_file file_path, after: /before_action.*\n(\s*before_action.*\n)*/, force: true do
<<-RUBY

  def #{action_name}
    puts "Hello World"
  end
RUBY
        end
      end
    else
      template "controller.rb", file_path
    end
  end
end
