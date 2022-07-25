# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Task->Seeding database:"

# Default admin
admin = Admin.new(email: 'admin@example.com',
                  first_name: Faker::Name.first_name,
                  last_name: Faker::Name.last_name,
                  password: 'password123',
                  password_confirmation: 'password123')
admin.save
puts " * [OK] Admin User (seed)"

# Default users
i = 1
while i < 5 do
  user = User.new(email: Faker::Internet.email,
                  first_name: Faker::Name.first_name,
                  last_name: Faker::Name.last_name,
                  password: 'password123',
                  password_confirmation: 'password123')
  user.save
  i += 1
end
puts " * [OK] Users (seed)"

# Default departments
i = 1
departments_array = ["Engineering", "QA", "Infrastructure", "Product Design"]
while i < 5 do
  department = Department.find_by(id: i)
  department = Department.create!(id: i,
                                  name: departments_array[i-1],
                                  division: "Technology",
                                  user_id: i) if department.nil?
  department.save
  i += 1
end
puts " * [OK] Departments (seed)"

# Default sources
i = 1
while i < 4
  source = Source.find_by(id: i)
  source = Source.create!(id: i,
                          name: Faker::Company.name,
                          contact_name: Faker::Name.name,
                          contact_title: Faker::Job.title,
                          contact_phone: Faker::PhoneNumber.phone_number_with_country_code,
                          contact_email: Faker::Internet.email,
                          is_internal: false) if source.nil?
  source.save
  i += 1
end
puts " * [OK] Sources (seed)"

# Default value streams
i = 1
while i < 5
  stream = Stream.find_by(id: i)
  stream = Stream.create!(id: i,
                          name: Faker::IndustrySegments.unique.industry,
                          business_unit: "Business Unit #{i}",
                          stakeholder_name: Faker::Name.name,
                          stakeholder_email: Faker::Internet.email) if stream.nil?
  stream.save
  i += 1
end
puts " * [OK] Value Streams (seed)"

# Default projects
i = 1
while i < 5
  project = Project.find_by(id: i)
  project = Project.create!(id: i,
                            stream_id: i,
                            name: Faker::App.name,
                            is_trackable: true,
                            is_internal: false,
                            start_date: Faker::Date.backward(days: i*10),
                            is_active: true) if project.nil?
  i += 1
end
project.save
puts " * [OK] Projects (seed)"

# Default roles for each department
i = 1
while i < 9
  role = Role.find_by(id: i)
  role = Role.create!(id: i,
                      name: Faker::Job.title,
                      is_shared: false,
                      is_administration: false,
                      department_id: Faker::Number.between(from: 1, to: 4)) if role.nil?
  i += 1
  role.save
end
puts " * [OK] Roles (seed)"

# Default currencies
i = 1
while i < 7
  currency = Currency.find_by(id: i)
  currency = Currency.create!(id: i,
                              name: Faker::Currency.name,
                              code: Faker::Currency.code,
                              exchange_rate: Faker::Number.between(from: 1, to: 3)) if currency.nil?
  currency.save
  i += 1
end
puts " * [OK] Currencies (seed)"

# Default members
i = 1
while i < 11
  member = Member.find_by(id: i)
  member = Member.create!(id: i,
                          first_name: Faker::Name.first_name,
                          last_name: Faker::Name.last_name,
                          role_id: Faker::Number.between(from:1, to:8),
                          department_id: Faker::Number.between(from:1, to: 4),
                          source_id: Faker::Number.between(from: 1, to: 3),
                          start_date: Faker::Date.backward(days: i * 30),
                          is_active: true) if member.nil?
  member.save
  i += 1
end
puts " * [OK] Members (seed)"

# Default teams
i = 1
while i < 11
  team = Team.find_by(id: i)
  team = Team.create!(id: i,
                      member_id: i,
                      project_id: Faker::Number.between(from: 1, to: 4),
                      annual_rate: Faker::Number.between(from: 80000, to: 140000),
                      weekly_rate: Faker::Number.between(from: 1538, to: 2692),
                      currency_id: Faker::Number.between(from: 1, to: 6),
                      start_date: Date.today,
                      allocation: 100) if team.nil?
  team.save
  i += 1
end
puts " * [OK] Teams (seed)"

# Default Jira projects
i = 1
while i < 5
  jira_project = JiraProject.find_by(id: i)
  jira_project = JiraProject.create!(id: i,
                                     project_id: Faker::Number.between(from: 1, to: 4),
                                     jira_project_id: i,
                                     name: Faker::App.name,
                                     jira_key: Faker::String.random(length:4),
                                     total_issue_count: 0,
                                     last_issue_update: DateTime.now,
                                     self_url: Faker::Internet.url)
  jira_project.save
  i += 1
end
puts " * [OK] Jira Projects (seed)"

# Default Jira issues
i = 1
while i < 5
  x = 1
  while x < 10
    key = (i * 10) + x
    jira_issue = JiraIssue.find_by(id: key)
    jira_issue = JiraIssue.create!(id: key,
                                   jira_issue_id: key,
                                   jira_project_id: i,
                                   issue_key: Faker::String.random(length: 5),
                                   issue_url: Faker::Internet.url,
                                   issue_title: Faker::Lorem.words(number: 5),
                                   issue_status: "Closed",
                                   issue_type: "Story",
                                   story_points: Faker::Number.between(from: 1, to: 8),
                                   issue_created: DateTime.now,
                                   issue_updated: DateTime.now
    )
    jira_issue.save
    x += 1
  end
  i += 1
end
puts " * [OK] Jira Issues (seed)"

# Share default credentials with the user
puts ""
puts "Default admin user credentials:"
puts "  Username: admin@example.com"
puts "  Password: password123"
