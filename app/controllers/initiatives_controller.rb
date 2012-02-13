class InitiativesController < ApplicationController
  # GET /initiatives
  # GET /initiatives.json
  def index
	@quarter = Quarter.find(params[:quarter_id])
	redirect_to quarter_path(@quarter)
  end

  # GET /initiatives/1
  # GET /initiatives/1.json
  def show
    @initiative = Initiative.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @initiative }
    end
  end

  # GET /quarters/1/initiatives/new
  # GET /quarters/1/initiatives/new.json
  def new
	@quarter = Quarter.find(params[:quarter_id])
    @initiative = @quarter.initiatives.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @quarter }
    end
  end

  # GET /quarter/1/initiatives/1/edit
  def edit
	@quarter = Quarter.find(params[:quarter_id])
    @initiative = @quarter.initiatives.find(params[:id])
  end

  # POST /initiatives
  # POST /initiatives.json
  def create
	@quarter = Quarter.find(params[:quarter_id])
	@initiative = @quarter.initiatives.create(params[:initiative])

    respond_to do |format|
      if @initiative.save
        format.html { redirect_to quarter_path(@quarter), notice: "#{@initiative.name} was successfully created." }
        format.json { render json: @initiative, status: :created, location: @initiative }
      else
        format.html { render action: "new" }
        format.json { render json: @initiative.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /initiatives/1
  # PUT /initiatives/1.json
  def update
	@quarter = Quarter.find(params[:quarter_id])
    @initiative = @quarter.initiatives.find(params[:id])

    respond_to do |format|
      if @initiative.update_attributes(params[:initiative])
        format.html { redirect_to @quarter, notice: 'Initiative was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @initiative.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /initiatives/1
  # DELETE /initiatives/1.json
  def destroy
	@quarter = Quarter.find(params[:quarter_id])
    @initiative = @quarter.initiatives.find(params[:id])
    @initiative.destroy

    respond_to do |format|
      format.html { redirect_to quarter_path(@quarter) }
      format.json { head :no_content }
    end
  end
end
