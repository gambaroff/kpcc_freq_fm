require 'json'
require 'sqlite3'

fileToLoad = 'seeds/development/users.json'
jsonStr = File.open(fileToLoad).read
json = JSON.parse(jsonStr)
db = SQLite3::Database.new "development.sqlite3"
json.each do |entry|
  db.execute "insert into users(uuid,user_name,following,user_role,created_at, updated_at) values (\'#{entry['uuid']}\', \'#{entry['user_name']}\', \'#{entry['following']}\', \'#{entry['user_role']}\', CURRENT_DATE, CURRENT_DATE)"
end