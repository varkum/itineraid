class ApplicationController < ActionController::Base
  include Authenticate
  include Protected
end
