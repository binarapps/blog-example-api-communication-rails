class EntriesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def new
    @entry = Entry.new
  end
  def create
    @entry = Entry.new(entry_params)
    if @entry.save
      redirect_to root_path
    else
      render :action => 'new'
    end
  end
  def show
    @entry = Entry.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render :json => @entry }
      format.xml  {render :xml => @entry}
    end
  end
  def index
    @entries = Entry.all
  end

  def entry_params
    params.require(:entry).permit(:name, :text, :file)
  end
end
