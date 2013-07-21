class CreateNewslettersController < ApplicationController
  # GET /create_newsletters
  # GET /create_newsletters.xml
  layout "application", :except => [:show, :edit, :create, :new]
  active_scaffold :create_newsletter do |config|
    config.columns = [:title, :tipo]
  end
  

  def show
    @create_newsletter = CreateNewsletter.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @create_newsletter }
    end
  end

  def new
    @create_newsletter = CreateNewsletter.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @create_newsletter }
    end
  end

  def edit
    @create_newsletter = CreateNewsletter.find(params[:id])
  end

  def create

    @create_newsletter = CreateNewsletter.new(params[:create_newsletter])

    respond_to do |format|
      if @create_newsletter.save
        format.html { redirect_to(@create_newsletter, :notice => 'CreateNewsletter was successfully created.') }
        format.xml  { render :xml => @create_newsletter, :status => :created, :location => @create_newsletter }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @create_newsletter.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @create_newsletter = CreateNewsletter.find(params[:id])

    respond_to do |format|
      if @create_newsletter.update_attributes(params[:create_newsletter])
        format.html { redirect_to(@create_newsletter, :notice => 'CreateNewsletter was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @create_newsletter.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @create_newsletter = CreateNewsletter.find(params[:id])
    @create_newsletter.destroy

    respond_to do |format|
      format.html { redirect_to(create_newsletters_url) }
      format.xml  { head :ok }
    end
  end

  def deliver
    @root_url = root_url
   
    if  params[:tipo_id].to_s == "1"
      clients = Pessoa.membros
    end
    if  params[:tipo_id].to_s == "2"
      clients = Pessoa.jovens
    end
    if  params[:tipo_id].to_s == "3"
      clients = Pessoa.evangelistas
    end
    if  params[:tipo_id].to_s == "4"
      clients = Pessoa.pa
    end
    if  params[:tipo_id].to_s == "5"
      clients = Pessoa.tias
    end
    if  params[:tipo_id].to_s == "6"
      clients = Pessoa.obreiros
    end
    if  params[:tipo_id].to_s == "99"
      clients = Pessoa.with_email
    end
    if  params[:tipo_id].to_s == "88"
      clients = Pessoa.aniversariantes
    end

    newsletter = CreateNewsletter.find(params[:carta])
    clients.each do |client|

      client.deliver(newsletter)
    end
    flash[:warning] = "#{clients.count} emails enviados com sucesso."
    redirect_to create_newsletters_url
  end
end
