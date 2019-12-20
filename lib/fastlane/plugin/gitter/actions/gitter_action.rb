require 'fastlane/action'
require_relative '../helper/gitter_helper'

module Fastlane
  module Actions
    class GitterAction < Action
      def self.run(params)
        require 'gitter'

        client = ::Gitter::Client.new(params[:access_token])

        if params[:room_id].nil?
          if params[:room_name].nil?
            return UI.user_error!("You must specify either room_id or room_name")
          end

          room = client.rooms.find {|room| room.name == params[:room_name] }
          if room.nil?
            return UI.user_error!("Couldn't find room #{params[:room_name].inspect}")
          end

          params[:room_id] = room.id
        end

        client.send_message(params[:message], params[:room_id])
        UI.success("Successfully sent Gitter message")
      end

      def self.description
        "Send a message to a Gitter room."
      end

      def self.authors
        ["andrewhavens"]
      end

      def self.return_value
      end

      def self.details
        "Send a message to a Gitter room."
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :message,
                                  env_name: "GITTER_MESSAGE",
                               description: "Message text to send",
                                  optional: false,
                                      type: String),
          FastlaneCore::ConfigItem.new(key: :room_name,
                                  env_name: "GITTER_ROOM_NAME",
                               description: "The name of the room to post the message to. If `:room_name` is specified instead of `:room_id` then the ID will be looked up based on the room name",
                       conflicting_options: [:room_id],
                                  optional: true,
                                      type: String),
          FastlaneCore::ConfigItem.new(key: :room_id,
                                  env_name: "GITTER_ROOM_ID",
                               description: "The ID of the room to post the message to",
                       conflicting_options: [:room_name],
                                  optional: true,
                                      type: String),
          FastlaneCore::ConfigItem.new(key: :access_token,
                                  env_name: "GITTER_ACCESS_TOKEN",
                               description: "The API access token of the user who will post the message",
                                  optional: false,
                                      type: String),
        ]
      end

      def self.is_supported?(platform)
        true
      end
    end
  end
end
