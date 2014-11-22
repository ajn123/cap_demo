class ScarvesController < ApplicationController
  before_action :set_scarf, only: [:show, :edit, :update, :destroy]

  # GET /scarves
  # GET /scarves.json
  def index
    @scarves = Scarf.all
  end

  # GET /scarves/1
  # GET /scarves/1.json
  def show
  end

  # GET /scarves/new
  def new
    @scarf = Scarf.new
  end

  # GET /scarves/1/edit
  def edit
  end

  # POST /scarves
  # POST /scarves.json
  def create
    @scarf = Scarf.new(scarf_params)

    respond_to do |format|
      if @scarf.save
        format.html { redirect_to @scarf, notice: 'Scarf was successfully created.' }
        format.json { render :show, status: :created, location: @scarf }
      else
        format.html { render :new }
        format.json { render json: @scarf.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scarves/1
  # PATCH/PUT /scarves/1.json
  def update
    respond_to do |format|
      if @scarf.update(scarf_params)
        format.html { redirect_to @scarf, notice: 'Scarf was successfully updated.' }
        format.json { render :show, status: :ok, location: @scarf }
      else
        format.html { render :edit }
        format.json { render json: @scarf.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scarves/1
  # DELETE /scarves/1.json
  def destroy
    @scarf.destroy
    respond_to do |format|
      format.html { redirect_to scarves_url, notice: 'Scarf was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scarf
      @scarf = Scarf.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def scarf_params
      params.require(:scarf).permit(:name)
    end
end
