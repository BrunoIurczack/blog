class ApplicationController < ::ApplicationController
  layout 'admin'
  authenticate_user!
end