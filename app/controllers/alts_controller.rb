class AltsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_alt, only: %i[ edit update destroy ]

  # GET /alts or /alts.json
  def index
    @alts = Alt.all
    @alt = Alt.new
  end

  # GET /alts/1 or /alts/1.json
  def show
    @alt_show = Alt.find(params[:id])
    @alt = Alt.find(params[:id])
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
    @alt = Alt.new(alt_params)

    respond_to do |format|
      if @alt.save
        image_modification_alt
        build_alt_text_versions
        format.js
        format.html { redirect_to alt_url(@alt), notice: "Alt was successfully created." }
        format.json { render :show, status: :created, location: @alt }
      else
        format.js
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @alt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /alts/1 or /alts/1.json
  def update
    respond_to do |format|
      if @alt.update(alt_params)
        image_modification_alt
        build_alt_text_versions
        format.html { redirect_to alt_url(@alt), notice: "Alt was successfully updated." }
        format.json { render :show, status: :ok, location: @alt }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @alt.errors, status: :unprocessable_entity }
      end
    end
  end

  def image_modification_alt
    @alt.image_derivatives!
    @alt.image_attacher.add_metadata(caption: @alt.title, alt: @alt.body)
    @alt.save
  end

  def build_alt_text_versions
    @alt_text = AltText.new(body: @alt.body, user_id: current_user.id, alt_id: @alt.id)
    @alt_text.save
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
      @alt = Alt.find(params[:id])
    end

    # Only allow a list of trusted parameters through.

    def alt_params
      params.require(:alt).permit(:body, :image, :title, :original_url, :original_source, :verified, :tag_list, :user_id)
    end
end
