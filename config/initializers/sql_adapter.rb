adapter = ActiveRecord::Base.connection.instance_values["config"][:adapter]
ENV['cast'] = adapter == "sqlite3" ? 'cast' : 'extract'