class PlanitemsController < ApplicationController
  # GET /planitems
  # GET /planitems.json
  def index
	redirect_to quarters_path
  end

  # GET /planitems/1
  # GET /planitems/1.json
  def show
    @planitem = Planitem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @planitem }
    end
  end

  # GET /planitems/new
  # GET /planitems/new.json
  def new
	# instantiate a model object
    @planitem = Planitem.new

	# Try to find the sprint from the URL param.
	# If one doesn't exist, we can't really
	# proceed because we don't know which quarter
	# to pull sprints from
	begin
		@sprint = Sprint.find(params[:sprint])
		@sprints = Sprint.where(:quarter_id => @sprint.quarter.id)
		@planitem.sprint = @sprint
	rescue ActiveRecord::RecordNotFound
		# We can't find the sprint, so get out quickly
		redirect_to quarters_path, :notice => "Please choose a plan first."
		return
	end

	# load up the teams for the select options
	@teams = Team.order(:name)
	# load up the initiatives for the select options
	@initiatives = Initiative.where(:quarter_id => @sprint.quarter_id)

	# Try to find the team from the URL param.
	# If one doesn't exist, that's ok, the user
	# can pick one from the list of teams.
	begin
		@team = Team.find(params[:team])
		@planitem.team = @team
	rescue ActiveRecord::RecordNotFound
		# If we can't find a team, no big deal
	end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @planitem }
    end
  end

  # GET /planitems/1/edit
  def edit
    @planitem = Planitem.find(params[:id])
	@sprints = Sprint.where(:quarter_id => @planitem.sprint.quarter_id)
	# load up the teams for the select options
	@teams = Team.order(:name)
	# load up the initiatives for the select options
	@initiatives = Initiative.where(:quarter_id => @planitem.sprint.quarter_id)
  end

  # POST /planitems
  # POST /planitems.json
  def create
    @planitem = Planitem.new(planitems_params)

    respond_to do |format|
      if @planitem.save
        format.html { redirect_to "#{plan_path(@planitem.sprint.quarter.name)}", notice: 'Plan item was successfully created.' }
        format.json { render json: @planitem, status: :created, location: @planitem }
      else
		@sprint = Sprint.find(@planitem.sprint_id)
		@teams = Team.order(:name)
		@initiatives = Initiative.where(:quarter_id => @sprint.quarter_id)
		@sprints = Sprint.where(:quarter_id => @sprint.quarter_id)
        format.html { render action: "new" }
        format.json { render json: @planitem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /planitems/1
  # PUT /planitems/1.json
  def update
    @planitem = Planitem.find(params[:id])

    respond_to do |format|
      if @planitem.update_attributes(planitems_params)
        format.html { redirect_to "#{plan_path(@planitem.sprint.quarter.name)}", notice: 'Plan item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @planitem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /planitems/1
  # DELETE /planitems/1.json
  def destroy
    @planitem = Planitem.find(params[:id])
	qtrname = @planitem.sprint.quarter.name
    @planitem.destroy

    respond_to do |format|
      format.html { redirect_to plan_path(qtrname) }
      format.json { head :no_content }
    end
  end

  private
  def planitems_params
    params.require(:planitem).permit(:description, :initiative_id, :sprint_id, :team_id, :itemtype, :committed, :notes)
  end

end
