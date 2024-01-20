class GamesController < ApplicationController
  before_action :set_game, only: %i[ show edit update destroy score_entry]

  # GET /games or /games.json
  def index
    @games = Game.all
  end

  def score_entry
    @game = Game.find(params[:id])
    @players = Player.all
    @holes = Hole.all
  
    @players.each do |player|
      @holes.each do |hole|
        # Construye un score solo si no existe uno para esta combinación de juego, jugador y hoyo
        unless @game.scores.exists?(player: player, hole: hole)
          @game.scores.build(player: player, hole: hole)
        end
      end
    end
  end
  

  # GET /games/1 or /games/1.json
  def show
  end

  # GET /games/new
  def new
    @game = Game.new
    @holes = Hole.all
    @players = Player.all
  end

  # GET /games/1/edit
  def edit
  end

  def create
    @game = Game.new(game_params)
    binding.pry
    if @game.save
      # Redirigir a donde sea pertinente
      redirect_to @game, notice: 'El juego fue creado exitosamente.'
    else
      render :new
    end
  end

  def update
    if @game.update(game_params)
      # Redirigir a donde sea pertinente
      redirect_to @game, notice: 'El juego fue actualizado exitosamente.'
    else
      render :edit
    end
  end

  # DELETE /games/1 or /games/1.json
  def destroy
    @game.destroy!

    respond_to do |format|
      format.html { redirect_to games_url, notice: "Game was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def game_params
      params.require(:game).permit(:date, :is_nine_holes, player_ids: [], scores_attributes: [:id, :strokes, :net, :points, :player_id, :hole_id])
    end
end
