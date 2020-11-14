class EventsController < ApplicationController
  def index
    @year = params[:year]
    @month = params[:month]
    @day_ = Date.new(@year.to_i,@month.to_i,1)
    @start_page_day = @day_.beginning_of_week.yesterday
    @end_page_day = @day_.end_of_month.end_of_week.yesterday
    @delta = @end_page_day - @start_page_day + 1
    d = @start_page_day
    @page_days = []
    for num in 1..@delta do
      @page_days << d
      d = d.tomorrow
    end
   end
  def show
    @year = params[:year]
    @month = params[:month]
    @aday = params[:aday]
    @theday_event = Event.where(start_year: @year.to_i,start_month: @month.to_i,start_day: @aday.to_i)
  end
  def new
    @year = params[:year]
    @month = params[:month]
    @aday = params[:aday]
    @event = Event.new
  end
  def create
    @year = params[:year]
    @month = params[:month]
    @aday = params[:aday]
    @event = Event.new(
      user: params[:user],
      name: params[:name],
      start_year: @year.to_i,
      start_month: @month.to_i,
      start_day: @aday.to_i,
      start_hour: params[:start_time].to_i,
      end_year: @year.to_i,
      end_month: @month.to_i,
      end_day: @aday.to_i,
      end_hour: params[:end_time].to_i ,
      place: params[:place],
      memo: params[:memo]
    )
    if @event.save
      flash[:notice] = "イベントの登録が完了しました"
      redirect_to("/events/#{@year}/#{@month}")
    else 

      render("events/new")
    end

  end
  
  def edit
    @event = Event.find_by(id: params[:event_id].to_i)    
  end

  def update
    @event = Event.find_by(id: params[:event_id].to_i)
    @event.user = params[:user]
    @event.name = params[:name]
    @event.start_hour = params[:start_time]
    @event.end_hour = params[:end_time]
    @event.place = params[:place]
    @event.memo = params[:memo]
    if @event.save
      flash[:notice] = "投稿を編集しました"
      redirect_to("/events/#{@event.start_year}/#{@event.start_month}")
    else
      render("events/edit")
    end
  end
  def detail
    @event = Event.find_by(id: params[:event_id].to_i)
  end
end
