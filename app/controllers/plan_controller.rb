class PlanController < ApplicationController
  def noqtr
	redirect_to quarters_path
  end

  def index
    @teams = Team.where(:group => ["Applications", "Services"]).order("`group`", :name)
	@quarter = Quarter.where(:name => params[:id]).first

	@filters = []
	# start out with filters from the session if they exist
	@filters = session[:filter] if session.include?(:filter)

	# but, if we have params, override the session
	if params[:filter] != nil
		# merge in any new filters from the params
		@filter_params = params[:filter].map { |f| f.to_i }
		@filters = @filter_params
		# put the filters back in the session
		session[:filter] = @filters
	else
		@planitems = {}
	end

	# look up the plan items matching the filters
	planitems = Planitem.joins(:initiative).where(:initiative_id => @filters).order("initiatives.priority asc", :description)
	@planitems = planitems_to_hash planitems

	# map the initiatives to a 0-based index so that we can colorize
	@colormap = {}
	@quarter.initiatives.each_with_index do |initiative, index|
		@colormap[initiative.id] = index
	end

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  private
  def planitems_to_hash(planitems)
	hash = {}
	planitems.each do |i|
		# do we have the team in the hash?
		if !hash.include?(i.team_id)
			hash[i.team_id] = {}
		end
		team = hash[i.team_id]
		# do we have the sprint for this team?
		if !team.include?(i.sprint_id)
			team[i.sprint_id] = []
		end
		# do we have an array of sprints?
		sprints = team[i.sprint_id];
		sprints << i
	end
	hash
  end
end
