Admin.controllers :meetings do

  get :index do 
    @meetings = Meeting.all
    render 'meetings/index'
  end

  get :new do
    @meeting = Meeting.new
    render 'meetings/new'
  end

  post :create do
    @meeting = Meeting.new(params[:meeting])
    if @meeting.save
      flash[:notice] = 'Meeting was successfully created.'
      redirect url(:meetings, :edit, :id => @meeting.id)
    else
      render 'meetings/new'
    end
  end

  get :edit, :with => :id do
    @meeting = Meeting.get(params[:id])
    render 'meetings/edit'
  end

  put :update, :with => :id do 
    @meeting = Meeting.get(params[:id])
    if @meeting.update(params[:meeting])
      flash[:notice] = 'Meeting was successfully update.'
      redirect url(:meetings, :edit, :id => @meeting.id)
    else
      render 'meetings/edit'
    end
  end

  delete :destroy, :with => id do
    meeting = Meeting.get(params[:id])
    if meeting.destroy
      flash[:notice] = "Meeting was successfully destroyed."
    else
      flash[:error] = "Could not destroy"
    end
  end
end
