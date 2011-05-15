class BoozesController < ApplicationController
  # GET /boozes
  # GET /boozes.xml
  def index
    @boozes = Booze.all
    @booze = Booze.new
    @current_user = current_user
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @boozes }
    end
  end

  # GET /boozes/1
  # GET /boozes/1.xml
  def show
    @booze = Booze.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @booze }
    end
  end


  # GET /boozes/new
  # GET /boozes/new.xml
  def new
    @booze = Booze.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @booze }
    end
  end

  # GET /boozes/1/edit
  def edit
    @booze = Booze.find(params[:id])
  end

  # POST /boozes
  # POST /boozes.xml
  def create
    @booze = Booze.new(params[:booze])

    respond_to do |format|
      if @booze.save
        @boozes = Booze.all
        @booze = Booze.new
        format.html { render :action => "index", :notice => 'Booze was successfully created.'}
        format.xml  { render :xml => @booze, :status => :created, :location => @booze }
      else
        @boozes = Booze.all
        format.html { render :action => "index" }
        format.xml  { render :xml => @booze.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /boozes/1
  # PUT /boozes/1.xml
  def update
    @booze = Booze.find(params[:id])

    respond_to do |format|
      if @booze.update_attributes(params[:booze])
        format.html { redirect_to(@booze, :notice => 'Booze was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @booze.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /boozes/1
  # DELETE /boozes/1.xml
  def destroy
    @booze = Booze.find(params[:id])
    @booze.destroy

    respond_to do |format|
      format.html { redirect_to(boozes_url) }
      format.xml  { head :ok }
    end
  end
end
