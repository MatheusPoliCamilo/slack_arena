class ArenaActionsController < ApplicationController
  require 'net/http'
  require 'uri'
  protect_from_forgery with: :null_session

  def index
    head :ok
  end

  # POST /arena
  # arena_actions_path
  def arena
    render json: { 
      "blocks": [
        {
          "type": "section",
          "text": {
            "type": "mrkdwn",
            "text": "Uma partida de Slack Arena está começando."
          },
          "accessory": {
            "type": "button",
            "text": {
              "type": "plain_text",
              "text": "Participar"
            },
            "value": "click_me_123",
            "action_id": "button"
          }
        }
      ]
    }
  end
end
