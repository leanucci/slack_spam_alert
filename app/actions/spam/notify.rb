require 'json'
require 'net/http'

module SlackSpamAlert
  module Actions
    class Notify < SlackSpamAlert::Action
      SLACK_WEBHOOK_URL = 'https://hooks.slack.com/services/your/webhook/url'
      SPAM_NOTIFICATION_TYPE = "Spam notification"

      def handle(request, response)
        request_payload = JSON.parse(request.body.read)
        if matches_criteria?(request_payload)
          send_alert_to_slack(request_payload)
          response.body = 'Alert sent to Slack channel'
        else
          response.body = 'Payload does not match criteria'
        end
      end

      private

      def matches_criteria?(payload)
        payload["Type"] == SPAM_NOTIFICATION_TYPE
      end

      def send_alert_to_slack(payload)
        uri = URI(SLACK_WEBHOOK_URL)
        header = {'Content-Type': 'application/json'}
        message = "Alert: #{payload.to_json}"
        body = {text: message}.to_json
        Net::HTTP.post(uri, body, header)
      end
    end
  end
end

