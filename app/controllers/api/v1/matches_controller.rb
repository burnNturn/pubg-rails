class Api::V1::MatchesController < Api::BaseController
  before_filter :find_match, only: [:show]

  def index
    render json: Match.all
  end

  def show
    render json: @match
  end

 private
   def find_match
     @match = Match.find_by_match_id(params[:id])
     render nothing: true, status: :not_found unless @match.present?
   end
 end