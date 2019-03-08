class TeamsController < ApplicationController
    before_action :set_team, only: [:show, :update, :destroy]
    
    def index
      @teams = Team.all
    end
    
    def form
      @team = Team.new
      render partial: 'form'
    end

    def show
    end
    
    def create
      @team = Team.new(team_params)
      if @team.save
        render json: @team
      else
        render_error(@team)
      end
    end
    
    def update
      if @team.update(team_params)
        render json: @team
      else
        render_error(@team)
      end
    end
    
    def destroy
      @team.destroy
      render json: { message: 'removed' }, status: :ok
    end
    
    private
      def set_team
        @team = Team.find(params[:id])
      end
  
     def team_params
       params.require(:team).permit(:name, :description)
     end
  end