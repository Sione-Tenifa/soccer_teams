class PlayersController < ApplicationController
  before_action :set_team, only: [:index, :create]
  before_action :set_player, only: [:show, :update, :destroy]

  def index
   render json: @team.players
  end

  def show
   render json: @player
  end

  def create
    @player = @team.players.new(player_params)
    if @player.save
      render json: @player
    else
      render_error(@player)
    end
  end

  def update
    if @player.update(player_params)
      render json: @player
    else
      render_error(@player)
    end
  end

  def destroy
    @player.destroy
    render json: { message: 'removed' }, status: :ok
  end

  private
    def set_team
      @team = Team.find(params[:team_id])
    end

    def set_character
      @player = Player.find(params[:id])
    end

    def player_params
      params.require(:player).permit(:name, :position)
    end
end
