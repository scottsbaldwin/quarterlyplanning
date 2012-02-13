class QuartersController < ApplicationController
  # GET /quarters
  # GET /quarters.json
  def index
    @quarters = Quarter.order(:name)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @quarters }
    end
  end

  # GET /quarters/1
  # GET /quarters/1.json
  def show
    @quarter = Quarter.find(params[:id])
	@initiative = @quarter.initiatives.new
	@sprint = @quarter.sprints.new

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @quarter }
    end
  end

  # GET /quarters/new
  # GET /quarters/new.json
  def new
    @quarter = Quarter.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @quarter }
    end
  end

  # GET /quarters/1/edit
  def edit
    @quarter = Quarter.find(params[:id])
  end

  # POST /quarters
  # POST /quarters.json
  def create
    @quarter = Quarter.new(params[:quarter])

    respond_to do |format|
      if @quarter.save
        format.html { redirect_to @quarter, notice: 'Quarter was successfully created.' }
        format.json { render json: @quarter, status: :created, location: @quarter }
      else
        format.html { render action: "new" }
        format.json { render json: @quarter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /quarters/1
  # PUT /quarters/1.json
  def update
    @quarter = Quarter.find(params[:id])

    respond_to do |format|
      if @quarter.update_attributes(params[:quarter])
        format.html { redirect_to @quarter, notice: 'Quarter was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @quarter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quarters/1
  # DELETE /quarters/1.json
  def destroy
    @quarter = Quarter.find(params[:id])
    @quarter.destroy

    respond_to do |format|
      format.html { redirect_to quarters_url }
      format.json { head :no_content }
    end
  end
end
