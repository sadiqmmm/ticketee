# Create admin if not exist
unless User.exists?(email: "admin@ticketee.com")
  puts "Admin Created"
  User.create!(email: "admin@ticketee.com", password: "password", admin: true)
end

unless User.exists?(email: "viewer@ticketee.com")
  puts "Viewer Created"
  User.create!(email: "viewer@ticketee.com", password: "password")
end

["Sublime Text 3", "Internet Explorer"].each do |name|
  unless Project.exists?(name: name)
    puts "Project Created"
    Project.create!(name: name, description: "A sample project about #{name}", author_id: 1)
  end
end