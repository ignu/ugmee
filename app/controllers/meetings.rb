Ugmee.controllers :meetings do
  get :index do
    @next_meeting = Meeting.all.last
    render "meetings/index"
  end
end
