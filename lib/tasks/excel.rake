namespace :excel do
  require 'roo'

  namespace :import do
    desc 'This utility allows you to import Excel, OpenOffice, LibreOffice spreadsheets to load various database tables.'

    # Import Members
    # User provides an input file that is either an Excel, OpenOffice, or LibreOffice spreadsheet.
    task members: :environment do
      filename = ARGV[0]
      if ARGV[1].empty?
        sheet = 0
      end
      puts "#{Time.now().strftime('%F - %H:%M:%S.%L')}:   Importing Members"

    end

    # Import
    task budget: :environment do

    end
  end

  namespace :export do
    desc 'This utility allows you to export certain data to Excel, OpenOffice, or LibreOffice spreadsheets.'

    task members: :environment do

    end

    task budget: :environment do

    end
  end
end