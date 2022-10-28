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
            "value": "join", # Não está sendo usado
            "action_id": "join_button"
          }
        }
      ]
    }
  end

  # POST /join
  # join_path
  def join
    action = params[:payload][:action]&.first[:action_id]
    if action == "join_button"
      player = Player.create_or_find_by!(slack_id: params[:payload][:user][:id])
      player.update!(health_points: 100)

      render json: {
        "response_type": "in_channel", # Mensagem visível para todos
        text: "<@#{player.slack_id}> entrou na partida!"
      }
    end
    head :unprocessable_entity
  end
end
