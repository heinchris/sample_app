class BoozeUserController < ApplicationController
  #get /boozes/add/1
  def add
    @booze = Booze.find(params[:id])
    @booze_user = BoozeUser.new
    respond_to do |format|
      format.html # add.html.erb
      format.xml  { render :xml => @booze }
    end
  end

  def remove
  end


  # POST /boozes/create
  # POST /boozes/create.xml
  def create
    @booze_user = BoozeUser.new(params[:booze_user])
    @booze_user.user = current_user

    respond_to do |format|
      if @booze_user.save
        @boozes = Booze.all
        format.html { redirect_to boozes_path, :notice => 'Booze #{@booze_user.booze.name} was successfully added to your account.'}
        format.xml  { render :xml => @booze, :status => :created, :location => @booze }
      else
        @booze_users = BoozeUser.all
        format.html { render :action => boozes_path }
        format.xml  { render :xml => @booze_user.errors, :status => :unprocessable_entity }
      end
    end
  end

end
