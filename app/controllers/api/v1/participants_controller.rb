class Api::V1::ParticipantsController < Api::BaseController
  before_filter :find_participant, only: [:show]

  def index
    render json: Participant.all
  end

  def show
    render json: @participant
  end

  private

  def find_participant
    match = Match.find_by(match_id: params[:match_id])
    player = Player.find_by(player_id: "account." + params[:id])
    @participant = Participant.find_by_match_id_and_player_id(match.id, player.id)
    render nothing: true, status: :not_found unless @participant.present?
  end
end