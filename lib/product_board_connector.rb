# frozen_string_literal: true

# Module: ProductBoardConnector
# This module provides the necessary functionality for interacting with the Product Board API
# from this application.
module ProductBoardConnector
  require 'faraday'
  require 'faraday/net_http'
  Faraday.default_adapter = :net_http

end