# frozen_string_literal: true

class ActionViewGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('templates', __dir__)
  argument :action_name, type: :string, default: 'index', banner: "action"

  def create_view_file
    template "action_view.html.slim", file_path
  end
  
  private

    def file_path
      File.join('app/views', class_name.underscore, "#{action_name}.#{format}.#{handler}")
    end

    def format
      :html
    end

    def handler
      :slim
    end
end
