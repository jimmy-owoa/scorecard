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
    @current_hole_number = params[:hole_number].presence.try(:to_i) || 1
    @current_hole = @holes.find_by(hole_number: @current_hole_number)
  
    if @current_hole.nil?
      # Manejar el caso en que el hoyo no se encuentra
      # Por ejemplo, redirigir a una página de error o establecer un hoyo predeterminado
    else
      @players.each do |player|
        score = @game.scores.find_or_initialize_by(player: player, hole: @current_hole)
        @game.scores << score if score.new_record?
      end
    end
  end
  
  
  def update_scores
    @game = Game.find(params[:id])
    @holes = Hole.all
    @current_hole_number = params[:current_hole_number].to_i
  
    if @game.update(game_params)
      next_hole_number = @current_hole_number + 1
  
      if next_hole_number <= @holes.count
        redirect_to score_entry_game_path(@game, hole_number: next_hole_number)
      else
        # Redirigir a resumen o página final
        redirect_to game_path(@game), notice: 'Juego completado'
      end
    else
      # Si la actualización falla, re-renderizar la vista del hoyo actual
      render 'score_entry', hole_number: @current_hole_number
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
    # binding.pry
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
