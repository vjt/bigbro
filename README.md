BigBro: A Google Analytics plugin for Rails
===========================================

Installation
------------

    gem install bigbro

Usage
-----

After the plugin has been loaded, you'll have an `analytics` helper to use
in your views. It generates an optimized version of the Google Analytics
code, and a `<noscript>` tag containing the direct path to the `__utm.gif`
image, to track JS-disabled browsers as well.

The `analytics` helper tracks the current page load by default, you can
disable this behaviour by passing the `:track => false` option.

Configuration
-------------

You must set your analytics account via the `BigBro.set()` method
in your `config/environment.rb`:

    BigBro.set(:account => 'UA-12345-67')

In production mode, the `.set()` method will raise an `ArgumentError` if
no account is provided, unless the `:disabled` option is set to `true`.

We use these switches to allow the developer to run the application in
production mode on `localhost` while not sending requests to Analytics.

We know that the ga.js is empty if the `Referer` is `localhost`, but
there are situations in which the referer is reset, thus a complete disable
is necessary.

In development mode the plugin is always disabled - unless you set an
account via the `set` method.

Testing
-------

A simple `assert_analytics()` helper is included in to aid verifying
that the layouts include the `analytics` helper. Its usage is super
simple:

    class FooControllerTest < ActionController::TestCase
      context "An user" do
        should "be tracked by analytics" do
          get :index
          assert_analytics
        end
      end
    end


Compatibility
-------------

Tested with Rails 2.3.8 with the `rails_xss` plugin installed,
running under Ruby 1.9.1-p378.
