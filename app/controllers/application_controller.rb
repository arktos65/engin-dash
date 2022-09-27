class ApplicationController < ActionController::Base
  logging_flag = ENV['ENGIN_HTTP_LOGGING']
  logging_file = ENV['ENGIN_HTTP_LOGFILE']

  if logging_flag == "TRUE"
    logging_mode = true
  else
    logging_mode = false
  end

  if logging_file.nil?
    logging_file = '/tmp/engin-http.log'
  end

  # Enable HTTP client logging for diagnostic purposes (not recommended for production
  # due to verbosity of the logging).
  log_options = {
    :http_logging       => logging_mode,                    # Enable verbose HTTP request/response logging in :log_file
    :log_file           => logging_file
  }
  # Create logging object for HTTP logging
  http_log = EnginApp::Logging.new(log_options)
end
