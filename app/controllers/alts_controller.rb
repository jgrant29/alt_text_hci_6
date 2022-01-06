class AltsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_alt, only: %i[ edit update destroy ]

  # GET /alts or /alts.json
  def index
    @alts = Alt.all
  end

  # GET /alts/1 or /alts/1.json
  def show
    @alt_show = Alt.find(params[:id])
  end

  # GET /alts/new
  def new
    @alt = Alt.new
  end

  # GET /alts/1/edit
  def edit
  end

  # POST /alts or /alts.json
  def create
    @alt = current_user.alts.new(alt_params)

    respond_to do |format|
      if @alt.save
        format.html { redirect_to alt_url(@alt), notice: "Alt was successfully created." }
        format.json { render :show, status: :created, location: @alt }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @alt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /alts/1 or /alts/1.json
  def update
    respond_to do |format|
      if @alt.update(alt_params)
        format.html { redirect_to alt_url(@alt), notice: "Alt was successfully updated." }
        format.json { render :show, status: :ok, location: @alt }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @alt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /alts/1 or /alts/1.json
  def destroy
    @alt.destroy

    respond_to do |format|
      format.html { redirect_to alts_url, notice: "Alt was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_alt
      @alt = current_user.alts.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def alt_params
      params.require(:alt).permit(:image, :title, :original_url, :original_source, :verified, :tag_list)
    end
end
