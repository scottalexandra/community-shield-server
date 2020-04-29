# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'

run Rails.application

use Rack::Cors do
  allow do
    origins 'localhost:5000'
    resource '/api/v1/*', headers: :any, methods: [:get, :post, :delete, :put, :patch, :options, :head], credentials: true
  end
end
