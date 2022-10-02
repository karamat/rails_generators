# frozen_string_literal: true

require 'base_controller_generator'

class GraphqlResolversGenerator < BaseControllerGenerator
  source_root File.expand_path('../templates', __FILE__)
  
  def create
    return unless class_name.present?

    generate 'graphql:object', class_name
    template "show.rb", show_file_path
    template "index.rb", index_file_path

    inject_into_file 'app/graphql/types/query_type.rb', before: /end\nend/, force: true do
<<-RUBY

    field :#{class_name.underscore}, resolver: Resolvers::#{class_name.pluralize}::#{class_name}
    field :#{class_name.underscore.pluralize}, resolver: Resolvers::#{class_name.pluralize}::#{class_name.pluralize}
RUBY
    end
  end

  private

  def show_file_path
    @show_file_name ||= File.join(generate_dir_path, "#{class_name.underscore}.rb")
  end

  def index_file_path
    @index_file_name ||= File.join(generate_dir_path, "#{class_name.underscore.pluralize}.rb")
  end

  def generate_dir_path
    dir_path = base_path + class_name.underscore.pluralize
    Dir.mkdir(dir_path) unless File.exist?(dir_path)
    dir_path
  end

  def base_path
    'app/graphql/resolvers/'
  end
end