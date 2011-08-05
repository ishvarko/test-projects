class TicketsController < ApplicationController
 
  # GET /tickets
  # GET /tickets.xml
  def index
     set_tab :list
    @tickets = Ticket.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tickets }
    end
  end
  
  def index_new
    set_tab :list_new
    @tickets = Ticket.where(:status => 1)
    
    respond_to do |format|
      format.html {render :action => "index"}
      format.xml  { render :xml => @tickets }
    end
  end
  
  def index_open
     set_tab :list_open
    @tickets = Ticket.where(:status => [1,2,3])
    
    respond_to do |format|
      format.html {render :action => "index"}
      format.xml  { render :xml => @tickets }
    end
  end
  
  def index_onhold
     set_tab :list_onhold
    @tickets = Ticket.where(:status => 3)
    
    respond_to do |format|
      format.html {render :action => "index"}
      format.xml  { render :xml => @tickets }
    end
  end
  def index_closed
     set_tab :list_closed
    @tickets = Ticket.where(:status => [4,5])
    
    respond_to do |format|
      format.html {render :action => "index"}
      format.xml  { render :xml => @tickets }
    end
  end

  # GET /tickets/new
  # GET /tickets/new.xml
  def new
    @ticket = Ticket.new
    @ticket.number = number_plus_one(Ticket.find(:last, :select => "number").number)
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ticket }
    end
  end

  # GET /tickets/1
  # GET /tickets/1.xml
  # GET /tickets/1/edit
  def edit
    @ticket = Ticket.find(params[:id])
    @changes = Change.find(:all, :order => "id")
    @statuses = Status.find(:all)
    @owners = User.find(:all)
    
  end
  
  # POST /tickets
  # POST /tickets.xml
  def create
    @ticket = Ticket.new(params[:ticket])
    respond_to do |format|
      if @ticket.save
        Notifier.ticked_created(@ticket).deliver
        format.html { redirect_to(:action => "edit",:id => @ticket.id, :notice => 'Ticket was successfully created.') }
        format.xml  { render :xml => @ticket, :status => :created, :location => @ticket }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ticket.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tickets/1
  # PUT /tickets/1.xml

  def update
    @ticket = Ticket.find(params[:id])
    @change = Change.new
    @change.ticket_id   = params[:id]
    
    @change.owner_old   = @ticket.owner
    @change.status_old  = @ticket.status
    @change.user        = session[:user_id]
    @ticket.owner       = params[:ticket]["owner"]
    @ticket.status      = params[:ticket]["status"]
    @change.owner_new   = params[:ticket]["owner"]
    @change.status_new  = params[:ticket]["status"]
    @change.reply_text  = params[:change]["reply_text"]
    
  
  respond_to do |format|
    if @ticket.save and @change.save
      Notifier.ticket_updated(@ticket,@change).deliver
      format.html { redirect_to( :action => "edit", :id => @ticket.id, :notice => 'Ticket was successfully updated.') }
      format.xml  { head :ok }
    else
      format.html { render :action => "edit" }
      format.xml  { render :xml => @ticket.errors, :status => :unprocessable_entity }
    end
  end 
  end
  
  # DELETE /tickets/1
  # DELETE /tickets/1.xml
  def destroy
    @ticket = Ticket.find(params[:id])
    @ticket.destroy

    respond_to do |format|
      format.html { redirect_to(tickets_url) }
      format.xml  { head :ok }
    end
  end
  # POST /search
  
  def search
    @ticket = Ticket.find_by_number(params[:number])
    if @ticket
      redirect_to( :action => "edit", :id => @ticket.id, :notice => 'Ticket was successfully updated.')
    else 
      redirect_to( :action => "index")
    end
  end
  def number_plus_one(number)
   # TODO: Rewrite method to autoincrement literals ex. AAB, AAC
   number=number.from(4)
   number=Integer(number.delete! "0")+1
   length=number.to_s.length
   if length > 5 then
        number.to_s
     else
        padded='AAA-' + '0' * (6-length)  + number.to_s
   end
  end
  
  
end
