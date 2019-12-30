class PushTokenController < ApplicationController

    def push_token
        client = Exponent::Push::Client.new
        # client = Exponent::Push::Client.new(gzip: true)  # for compressed, faster requests

        messages = [{
        to: "ExponentPushToken[xxxxxxxxxxxxxxxxxxxxxx]",
        sound: "default",
        body: "Hello world!"
        }, {
        to: "ExponentPushToken[yyyyyyyyyyyyyyyyyyyyyy]",
        badge: 1,
        body: "You've got mail",
        _displayInForeground: true
        }]

        client.publish messages
        byebug
    end
end
