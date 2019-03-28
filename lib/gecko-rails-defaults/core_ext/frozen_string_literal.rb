# Add # frozen_string_literal: true to all generated migrations
# See https://gist.github.com/ta1kt0me/6a7058d16621785d4f7038bde6cd3b98

module AddFrozenStringLiteralComment
  def add_frozen_string_literal_comment(dist)
    if File.exist?(dist) && File.extname(dist) == '.rb'
      File.open(dist, 'r') do |f|
        body = f.read

        File.open(dist, 'w') do |new_f|
          new_f.write("# frozen_string_literal: true\n" + body)
        end
      end
    end
  end
end

Rails::Generators::Actions::CreateMigration.send :prepend, GeneratorPrepend
