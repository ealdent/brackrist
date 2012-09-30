class PilotsController < ApplicationController
  PILOTS_PER_PAGE = 15

  def index
    @pilots = if params[:q]
      Pilot.where(['name ILIKE ?', "%%#{params[:q]}%%"])
    else
      Pilot.where('name IS NOT NULL')
    end

    if params[:corporation_id]
      @pilots = @pilots.where(:corporation_id => params[:corporation_id])
      @corporation = Corporation.find(params[:corporation_id])
    else
      @corporation = nil
    end

    @total_pages = (@pilots.count / PILOTS_PER_PAGE.to_f).ceil
    @current_page = (params[:page] || 1).to_i

    offset_val = if params[:page].blank?
      0
    elsif params[:page].to_i > @total_pages
      @total_pages
    else
      (params[:page].to_i - 1) * PILOTS_PER_PAGE
    end

    respond_to do |format|
      format.html do
        @pilots = @pilots.order('LOWER(name) ASC').limit(PILOTS_PER_PAGE).offset(offset_val)
      end
      format.csv do
        @pilots.order('LOWER(name) ASC')
        headers['Content-Disposition'] = 'attachment; filename="pilots.csv"'
        render :layout => false
      end
    end
  end

  def show
    @pilot = Pilot.find(params[:id], :order => "name ASC")
  end

  def new
    @pilot = Pilot.new
  end

  def create
    @pilot = Pilot.create(params[:pilot].merge(:user => @current_user))
    unless params[:corporation_name].blank?
      @corporation = Corporation.find_or_create_by_name(params[:corporation_name])
      @pilot.corporation = @corporation
      @pilot.save!
    end
    redirect_to pilots_url
  end
end
