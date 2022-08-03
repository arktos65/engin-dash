namespace :import do
  require 'yaml'

  desc "This utility allwos you to import YAML files to load various database tables."

  # Import Departments
  # User provides an input file in YAML format that will load the departments table.
  task departments: :environment do
    puts "#{Time.now().strftime('%F - %H:%M:%S.%L')}:   Importing Departments"
    filename = ARGV[0]
    depts_from_yaml = YAML.load_stream(File.read(filename))

    i = 0
    while i < depts_from_yaml.count do
      department = Department.new(id: depts_from_yaml[i]["id"],
                                  name: depts_from_yaml[i]["name"],
                                  division: depts_from_yaml[i]["division"],
                                  user_id: depts_from_yaml[i]["user_id"])
      department.save
      i += 1
    end

    puts "#{Time.now().strftime('%F - %H:%M:%S.%L')}:   Task complete"
  end

  # Import Admins
  # User provides an input file in YAML format that will create Devise admin users in the
  # application.
  task admins: :environment do
    puts "#{Time.now().strftime('%F - %H:%M:%S.%L')}:   Importing Admin users"
    filename = ARGV[0]
    admins_from_yaml = YAML.load_stream(File.read(filename))

    i = 0
    while i < admins_from_yaml.count do
      admin = Admin.new(email: admins_from_yaml[i]["email"],
                        first_name: admins_from_yaml[i]["first_name"],
                        last_name: admins_from_yaml[i]["email"],
                        password: admins_from_yaml[i]["password"],
                        password_confirmation: admins_from_yaml[i]["password"])
      admin.save
      i += 1
    end

    puts "#{Time.now().strftime('%F - %H:%M:%S.%L')}:   Task complete"
  end

  # Import Users
  # User provides an input file in YAML format that will create Devise users in the application.
  task users: :environment do
    puts "#{Time.now().strftime('%F - %H:%M:%S.%L')}:   Importing Users"
    filename = ARGV[0]
    users_from_yaml = YAML.load_stream(File.read(filename))

    i = 0
    while i < users_from_yaml.count do
      user = User.new(email: users_from_yaml[i]["email"],
                      first_name: users_from_yaml[i]["first_name"],
                      last_name: users_from_yaml[i]["email"],
                      password: users_from_yaml[i]["password"],
                      password_confirmation: users_from_yaml[i]["password"])
      user.save
      i += 1
    end

    puts "#{Time.now().strftime('%F - %H:%M:%S.%L')}:   Task complete"
  end

  # Import Sources
  # User profiles an input file in YAML format that will create Sources in the database.
  task sources: :environment do
    puts "#{Time.now().strftime('%F - %H:%M:%S.%L')}:   Importing Sources"
    filename = ARGV[0]
    sources_from_yaml = YAML.load_stream(File.read(filename))

    i = 0
    while i < sources_from_yaml.count do
      source = Source.new(id: sources_from_yaml[i]["id"],
                          name: sources_from_yaml[i]["name"],
                          contact_name: sources_from_yaml[i]["contact_name"],
                          contact_title: sources_from_yaml[i]["contact_title"],
                          contact_phone: sources_from_yaml[i]["contact_phone"],
                          contact_email: sources_from_yaml[i]["contact_email"],
                          is_internal: sources_from_yaml[i]["is_internal"])
      source.save
      i += 1
    end

    puts "#{Time.now().strftime('%F - %H:%M:%S.%L')}:   Task complete"
  end

  # Import Currencies
  # Import currencies and exchange rates from an input file in YAML format.
  task currencies: :environment do
    puts "#{Time.now().strftime('%F - %H:%M:%S.%L')}:   Importing Currencies"
    filename = ARGV[0]
    currency_from_yaml = YAML.load_stream(File.read(filename))

    i = 0
    while i < currency_from_yaml.count do
      currency = Currency.new(id: currency_from_yaml[i]["id"],
                              name: currency_from_yaml[i]["name"],
                              code: currency_from_yaml[i]["code"],
                              exchange_rate: currency_from_yaml[i]["exchange_rate"])
      currency.save
      i += 1
    end

    puts "#{Time.now().strftime('%F - %H:%M:%S.%L')}:   Task complete"
  end

  # Import Roles
  # Import job roles from an input file in YAML format.
  task roles: :environment do
    puts "#{Time.now().strftime('%F - %H:%M:%S.%L')}:   Importing Job Roles"
    filename = ARGV[0]
    roles_from_yaml = YAML.load_stream(File.read(filename))

    i = 0
    while i < roles_from_yaml.count do
      role = Role.new(id: roles_from_yaml[i]["id"],
                      name: roles_from_yaml[i]["name"],
                      is_shared: roles_from_yaml[i]["is_shared"],
                      is_administration: roles_from_yaml[i]["is_administration"],
                      department_id: roles_from_yaml[i]["department_id"])
      role.save
      i += 1
    end

    puts "#{Time.now().strftime('%F - %H:%M:%S.%L')}:   Task complete"
  end

  # Import Streams
  # Import value streams from an input file formatted in YAML.
  task streams: :environment do
    puts "#{Time.now().strftime('%F - %H:%M:%S.%L')}:   Importing Value Streams"
    filename = ARGV[0]
    streams_from_yaml = YAML.load_stream(File.read(filename))

    i = 0
    while i < streams_from_yaml.count do
      stream = Stream.new(id: streams_from_yaml[i]["id"],
                        name: streams_from_yaml[i]["name"],
                        business_unit: streams_from_yaml[i]["business_unit"],
                        stakeholder_name: streams_from_yaml[i]["stakeholder_name"],
                        stakeholder_email: streams_from_yaml[i]["stakeholder_email"])
      stream.save
      i += 1
    end

    puts "#{Time.now().strftime('%F - %H:%M:%S.%L')}:   Task complete"
  end

  # Import Projects
  # From a YAML input file to load projects database table.
  task projects: :environment do
    puts "#{Time.now().strftime('%F - %H:%M:%S.%L')}:   Importing Projects"
    filename = ARGV[0]
    projects_from_yaml = YAML.load_stream(File.read(filename))

    i = 0
    while i < projects_from_yaml.count do
      project = Project.new(id: projects_from_yaml[i]["id"],
                            stream_id: projects_from_yaml[i]["stream_id"],
                            name: projects_from_yaml[i]["name"],
                            is_trackable: projects_from_yaml[i]["is_trackable"],
                            is_internal: projects_from_yaml[i]["is_internal"],
                            start_date: projects_from_yaml[i]["start_date"],
                            end_date: projects_from_yaml[i]["end_date"],
                            is_active: projects_from_yaml[i]["is_active"])
      project.save
      i += 1
    end

    puts "#{Time.now().strftime('%F - %H:%M:%S.%L')}:   Task complete"
  end

  # Import Members
  # From a YAML input file to load members database table.
  task members: :environment do
    puts "#{Time.now().strftime('%F - %H:%M:%S.%L')}:   Importing Members"
    filename = ARGV[0]
    members_from_yaml = YAML.load_stream(File.read(filename))

    i = 0
    while i < members_from_yaml.count do
      member = Member.new(id: members_from_yaml[i]["id"],
                           first_name: members_from_yaml[i]["first_name"],
                           last_name: members_from_yaml[i]["last_name"],
                           role_id: members_from_yaml[i]["role_id"],
                           department_id: members_from_yaml[i]["department_id"],
                           source_id: members_from_yaml[i]["source_id"],
                           start_date: members_from_yaml[i]["start_date"],
                           end_date: members_from_yaml[i]["end_date"],
                           is_active: members_from_yaml[i]["is_active"])
      member.save
      i += 1
    end

    puts "#{Time.now().strftime('%F - %H:%M:%S.%L')}:   Task complete"
  end
end
