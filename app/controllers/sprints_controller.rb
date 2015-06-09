class SprintsController < ApplicationController
  # GET /sprints
  # GET /sprints.json
  def index
	@quarter = Quarter.find(params[:quarter_id])
	redirect_to quarter_path(@quarter)
  end

  # GET /sprints/1
  # GET /sprints/1.json
  def show
    @sprint = Sprint.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sprint }
    end
  end

  # GET /quarters/1/sprints/new
  # GET /quarters/1/sprints/new.json
  def new
	@quarter = Quarter.find(params[:quarter_id])
    @sprint = @quarter.sprints.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sprint }
    end
  end

  # GET /sprints/1/edit
  def edit
    @sprint = Sprint.find(params[:id])
  end

  # POST /sprints
  # POST /sprints.json
  def create
	@quarter = Quarter.find(params[:quarter_id])
    @sprint = @quarter.sprints.create(sprint_params)

    respond_to do |format|
      if @sprint.save
        format.html { redirect_to quarter_path(@quarter), notice: "#{@sprint.name} was successfully created." }
        format.json { render json: @sprint, status: :created, location: @sprint }
      else
        format.html { render action: "new" }
        format.json { render json: @sprint.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sprints/1
  # PUT /sprints/1.json
  def update
	@quarter = Quarter.find(params[:quarter_id])
    @sprint = @quarter.sprints.find(params[:id])

    respond_to do |format|
      if @sprint.update_attributes(sprint_params)
        format.html { redirect_to @quarter, notice: 'Sprint was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sprint.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sprints/1
  # DELETE /sprints/1.json
  def destroy
	@quarter = Quarter.find(params[:quarter_id])
    @sprint = @quarter.sprints.find(params[:id])
    @sprint.destroy

    respond_to do |format|
      format.html { redirect_to quarter_path(@quarter) }
      format.json { head :no_content }
    end
  end

  private
  def sprint_params
    params.require(:sprint).permit(:name)
  end
end
