module Site
  class ApplicationController < ::ApplicationController
    layout 'site'

    before_action :load_categories

    def load_categories
      @categories = Category.all
    end
  end
end