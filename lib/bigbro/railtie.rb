require 'bigbro'

module BigBro

  if defined? Rails::Railtie
    class Railtie < Rails::Railtie
      initializer 'bigbro.insert_into_action_view' do
        ActiveSupport.on_load :action_view do
          BigBro::Railtie.insert
        end
      end
    end
  end

  class Railtie
    def self.insert
      ActionView::Base.instance_eval { include BigBro::Helpers }
      ActiveSupport::TestCase.instance_eval { include BigBro::TestHelpers } if Rails.env.test?
    end
  end

end
