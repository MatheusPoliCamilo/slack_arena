class ArenaActionsController < ApplicationController
  require 'net/http'
  require 'uri'
  protect_from_forgery with: :null_session

  def index
    head :ok
  end

  # POST /arena
  # arena_path
  def arena
    player = Player.create_or_find_by!(slack_id: params[:user_id])
    player.update!(health_points: 100)

    render json: {
      "response_type": "in_channel", # Mensagem visível para todos
      "blocks": [
        {
          "type": "section",
          "text": {
            "type": "mrkdwn",
            "text": "<@#{player.slack_id}> está inciando uma partida de Slack Arena."
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

  # POST /join
  # join_path
  def join
    render json: { "text": "Você entrou na arena!" }
  end
end
