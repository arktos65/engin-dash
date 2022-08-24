# frozen_string_literal: true

require 'faraday'
require 'faraday/net_http'
require 'faraday/retry'

# Module: ProductBoard::Client
# This module provides the necessary functionality for interacting with the Product Board API
# from this application.
module ProductBoard
  class Client

    DEFINED_OPTIONS = [
      :site,
      :context_path,
      :default_headers,
      :read_timeout,
      :http_debug
    ]

    DEFAULT_OPTIONS = {
      site: 'https://api.productboard.com',
      context_path: '/',
      read_timeout: 120,
      default_headers: {'X-Version' => '1'}
    }

    # Initialize the state and values for the ProductBoard::Client object.
    # Configuration variables are accessed through @PB_CONFIG.
    def initialize(options = {})
      options = DEFAULT_OPTIONS.merge(options)
      @options = options

      unknown_options = options.keys.reject { |o| DEFINED_OPTIONS.include?(o) }
      raise ArgumentError, "Unknown option(s) given: #{unknown_options}" unless unknown_options.empty?

      # Set the default adapter to net_http for all requests through Faraday
      Faraday.default_adapter = :net_http

      # Load application configuration when this object is instantiated
      raw_config = File.read("#{Rails.root}/config/engin-productboard.yml")
      @PB_CONFIG = YAML.load(raw_config)

      # Initialize Faraday object connected to ProductBoard API
      @request_client = Faraday.new(@options[:site]) do |f|
        f.request :json             # Encode all request bodies as JSON and set Content-Type header
        f.request :retry            # Retry transient failures
        f.response :json            # Encode all response bodies as JSON
        f.options.timeout = @options[:read_timeout]
      end
      @options.freeze
    end

    # Generic API request method that injects Bearer token automatically in each request.
    def request(conn, uri, params)
      conn.get uri, params do |r|
        r.headers["Authorization"] = @PB_CONFIG["product_board"]["api"]["token"]
        r.headers = @options[:default_headers]
      end
    end

    # HTTP methods without a body
    def get(path, headers = {})
      request(:get, path, nil, merge_default_headers(headers))
    end

    def head(path, headers = {})
      request(:head, path, nil, merge_default_headers(headers))
    end

    # Sends the specified HTTP request to the REST API through the
    # appropriate access method.
    def request(http_method, path, body = '', headers = {})
      puts "#{http_method}: #{path} - [#{body}]" if @http_debug
      @request_client.request(http_method, path, body, headers)
    end
  end
end