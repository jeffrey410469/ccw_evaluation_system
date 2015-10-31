class Admin::EventsController < Admin::BaseController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /admin/events
  def index
    @events = @evaluation.events.includes(:interpellation).all
  end

  # GET /admin/events/1
  def show
  end

  # GET /admin/events/new
  def new
    @event = @evaluation.events.build
    @interpellations = @evaluation.interpellations
  end

  # GET /admin/events/1/edit
  def edit
  end

  # POST /admin/events
  def create
    @event = @evaluation.events.build(event_params)

    if @event.save
      redirect_to [:admin, :events], notice: '成功新增活甕'
    else
      render :new
    end
  end

  # PATCH/PUT /admin/events/1
  def update
    if @event.update(event_params)
      redirect_to [:admin, @event], notice: '成功更新活動'
    else
      render :edit
    end
  end

  # DELETE /admin/events/1
  def destroy
    @event.destroy
    redirect_to admin_events_url, notice: '成功刪除活動'
  end

  private

    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def event_params
      params[:event].permit(:name, :evaluation_id, :interpellation_id)
    end
end
