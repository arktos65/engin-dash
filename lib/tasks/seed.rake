namespace :seed do
  desc "Database seeding commands"
  task admins: :environment do
    # Technology Division Admins
    admin_emails = ['sean.sullivan@beatport.com','sedin.dugum@beatport.com']
    admin_names = ['Sean Sullivan','Sedin Dugum']
    i = 0
    while i < admin_emails.count do
      names = admin_names[i].split
      admin = Admin.new(email: admin_emails[i],
                        first_name: names[0],
                        last_name: names[1],
                        password: 'password123',
                        password_confirmation: 'password123')
      admin.save
      i += 1
    end
    puts " * [OK] Devise Admin Users"
  end

  task users: :environment do
    # Technology Division Users
    user_emails = ['adrian.williams@beatport.com','dan.freeman@beatport.com','mark.demma@beatport.com','morgan.soley@beatport.com']
    user_names = ['Adrian Williams','Dan Freeman','Mark Demma','Morgan Soley']
    i = 0
    while i < user_emails.count do
      names = user_names[i].split
      user = User.new(email: user_emails[i],
                      first_name: names[0],
                      last_name: names[1],
                      password: 'password123',
                      password_confirmation: 'password123')
      user.save
      i += 1
    end
    puts " * [OK] Devise Users"
  end

  task departments: :environment do
    # Technology Departments
    i = 0
    departments_array = ['Product','Product Design','QA','SRE','Engineering']
    department_emails = ['adrian.williams@beatport.com','dan.freeman@beatport.com','mark.demma@beatport.com',
                         'mark.demma@beatport.com','morgan.soley@beatport.com']
    while i < departments_array.count do
      dept_mgr = User.find_by(email: department_emails[i])
      department = Department.find_by(id: i + 1)
      department = Department.create!(id: i + 1,
                                      name: departments_array[i],
                                      division: "Beatport Technology Group",
                                      user_id: dept_mgr.id) if department.nil?
      department.save
      i += 1
    end
    puts " * [OK] Departments"
  end

  task sources: :environment do
    # Sources
    i = 0
    source_array = ['Beatport Group','Consultant','Encora','Ministry of Programming','Sowlutions']
    contacts_array = ['Sean Sullivan','Sean Sullivan','Karen Garcia','Tarik Hamzic','Abdo Achkar']
    while i < source_array.count
      source = Source.find_by(id: i + 1)
      source = Source.create!(id: i,
                              name: source_array[i],
                              contact_name: contacts_array[i],
                              contact_title: nil,
                              contact_phone: nil,
                              contact_email: nil,
                              is_internal: false) if source.nil?
      source.save
      i += 1
    end
    puts " * [OK] Sources"
  end

  task streams: :environment do
    # Beatport Value Streams
    i = 0
    stream_array = ['DJ Group','Producer Group','Music Services','Internal Services','Technology']
    unit_array = ['DJ Group','Producer Group','Music Services','Operations','Technology']
    stakeholders = ['Romain Pouillon','Gareth Halsall','Alex Branson','Brandon Shevin','Sean Sullivan']
    while i < stream_array.count
      stream = Stream.find_by(id: i + 1)
      stream = Stream.create!(id: i + 1,
                              name: stream_array[i],
                              business_unit: unit_array[i],
                              stakeholder_name: stakeholders[i],
                              stakeholder_email: nil) if stream.nil?
      stream.save
      i += 1
    end
    puts " * [OK] Value Streams (production)"
  end

  task projects: :environment do
    # Default projects
    i = 0
    project_array = ['Beatport|1|1|0','Beatsource|1|1|0','Beatport Mobile|1|1|0','LINK|1|1|0','Loopmasters|2|0|0',
                     'Loopcloud|2|0|0','Plugin Boutique|2|0|0','Ampsuite|3|0|0','Label Radar|3|0|0',
                     'Ingestion|4|1|1','CMS|4|1|1']
    while i < project_array.count
      item = project_array[i].split('|')
      if item[2] == '1'
        is_trackable = true
      else
        is_trackable = false
      end
      if item[3] == '1'
        is_internal = true
      else
        is_internal = false
      end
      project = Project.find_by(id: i + 1)
      project = Project.create!(id: i + 1,
                                stream_id: item[1],
                                name: item[0],
                                is_trackable: is_trackable,
                                is_internal: is_internal,
                                start_date: '2022-01-01',
                                is_active: true) if project.nil?
      i += 1
    end
    project.save
    puts " * [OK] Projects"
  end

  task currencies: :environment do
    # Default currencies
    i = 0
    currency_array = ['US Dollar|USD|1.00','Euro|EUR|1.20','British Pounds|GBP|1.30']
    while i < currency_array.count
      item = currency_array[i].split('|')
      currency = Currency.find_by(id: i + 1)
      currency = Currency.create!(id: i + 1,
                                  name: item[0],
                                  code: item[1],
                                  exchange_rate: item[3].to_d) if currency.nil?
      currency.save
      i += 1
    end
    puts " * [OK] Currencies"
  end
end
