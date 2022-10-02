# frozen_string_literal: true

require 'base_controller_generator'

class GraphqlTypeGenerator < BaseControllerGenerator
  source_root File.expand_path('../templates', __FILE__)
  
  def create
    return unless class_name.present?

    generate 'graphql:object', class_name
    template "type.rb", type_file_path
    template "type_attributes.rb", attribute_file_path

#     inject_into_file base_path + '/query_type.rb', before: /end\nend/, force: true do
# <<-RUBY

#     field :#{class_name.underscore}, resolver: Resolvers::#{class_name.pluralize}::#{class_name}
# RUBY
#     end  
  end

  private

  def type_file_path
    @type_file_name ||= File.join(generate_dir_path, "#{class_name.underscore}_type.rb")
  end

  def attribute_file_path
    @attribute_file_name ||= File.join(generate_dir_path, "#{class_name.underscore}_attributes.rb")
  end

  def generate_dir_path
    dir_path = base_path + class_name.underscore.pluralize
    Dir.mkdir(dir_path) unless File.exist?(dir_path)
    dir_path
  end

  def base_path
    'app/graphql/types/'
  end
end