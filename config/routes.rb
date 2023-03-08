# frozen_string_literal: true

module SlackSpamAlert
  class Routes < Hanami::Routes
    root { "Hello from Hanami" }
    post '/spam/notify', to: 'spam.notify'
    get "/spam/process", to: "spam.process"
  end
end
