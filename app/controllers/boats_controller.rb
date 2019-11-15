class BoatsController < ApplicationController
  before_action :set_boat, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:home, :index, :show]
  # GET /boats
  # GET /boats.json
  def home
  end

  def index
    date_begin = params[:daterange].split('-')[0] if params[:date_range].present?
    @sql =  "boats.date_end - current_date > 0 OR boats.date_end is null "
    @sql += "and Boats.city ILIKE '#{'%'+params[:city]+'%'}' " if params[:city].present?
    @sql += "and Boats.price <= #{params[:price].to_i}" if params[:price].present?
    @sql += "and Boats.date_end - date '#{date_begin}' > 0 OR boats.date_end is null " if params[:date_range].present?
    @sql += "and Boats.category ILIKE '#{'%'+params[:category]+'%'}' " if params[:category].present?
    @boats = Boat.where(@sql)
    @count = @boats.count
    @count_tt = Boat.all.count
  end

  # GET /boats/1
  # GET /boats/1.json
  def show
  end

  # GET /boats/new
  def new
    @boat = Boat.new
    @user = User.new
  end

  # GET /boats/1/edit
  def edit
  end

  # POST /boats
  # POST /boats.json
  def create
    @boat = Boat.new(boat_params)

    respond_to do |format|
      if @boat.save
        format.html { redirect_to '/users/edit', notice: 'Boat was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /boats/1
  # PATCH/PUT /boats/1.json
  def update
    respond_to do |format|
      if @boat.update(boat_params)
        format.html { redirect_to '/users/edit', notice: 'Boat was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /boats/1
  # DELETE /boats/1.json
  def destroy
    @boat.destroy
    respond_to do |format|
      format.html { redirect_to '/users/edit', notice: 'Boat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_boat
      @boat = Boat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def boat_params
      param_user = {user_id: current_user.id}
      params.require(:boat).permit(:name, :photo, :category, :city, :long, :lat, :price, :available, :capacity).merge(param_user)
    end
end
