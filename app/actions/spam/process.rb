# frozen_string_literal: true

module SlackSpamAlert
  module Actions
    module Spam
      class Process < SlackSpamAlert::Action
        def handle(*, response)
          response.body = self.class.name
        end
      end
    end
  end
end
