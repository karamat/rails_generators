# frozen_string_literal: true

require 'base_controller_generator'

class GraphqlMutationsGenerator < BaseControllerGenerator
  source_root File.expand_path('../templates', __FILE__)
  
  def create
    return unless class_name.present?

    generate 'graphql:object', class_name
    template "create.rb", create_file_path
    template "update.rb", update_file_path
    template "delete.rb", delete_file_path

    inject_into_file 'app/graphql/types/mutation_type.rb', before: /end\nend/, force: true do
<<-RUBY

    field :create_#{class_name.underscore}, mutation: Mutations::#{class_name.pluralize}::Create#{class_name}
    field :delete_#{class_name.underscore}, mutation: Mutations::#{class_name.pluralize}::Delete#{class_name}
    field :update_#{class_name.underscore}, mutation: Mutations::#{class_name.pluralize}::Update#{class_name}
RUBY
    end
  end

  private

  def create_file_path
    @create_file_name ||= File.join(generate_dir_path, "create_#{class_name.underscore}.rb")
  end

  def update_file_path
    @update_file_name ||= File.join(generate_dir_path, "update_#{class_name.underscore}.rb")
  end

  def delete_file_path
    @delete_file_name ||= File.join(generate_dir_path, "delete_#{class_name.underscore}.rb")
  end

  def generate_dir_path
    dir_path = base_path + class_name.underscore.pluralize
    Dir.mkdir(dir_path) unless File.exist?(dir_path)
    dir_path
  end

  def base_path
    'app/graphql/mutations/'
  end
end