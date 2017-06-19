class ContactsController < ApplicationController

  require 'csv'

  before_action :set_contact, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!


# - pulls list of contacts dependend ont user signed in
# - pulls deactivated contatcs for separate displaying
# - @function 
#   + used in #index (here) and (search_contacts)
#   + #index is reused by #search_contacts for rendering results
#   + string rendered in <h1> at app/views/contacts/index.html.erb
# - responds with csv when pormpted by user 
  def index
    @contacts = Contact.where( "user_id = ? and deactivate = false", current_user.id ) || []    
    @deactivated_contacts = Contact.where( "user_id = ? and deactivate = true", current_user.id)
    @function = "Contacts"

    respond_to do |format| 

      format.html 
      format.csv { send_data Contact.to_csv }

    end

  end

    # - displays a contact 
    # - returns conrresponding csv 
  def show

    @contact = Contact.find params['id']
    
    respond_to do |format|    

      format.html 

      format.csv { send_data @contact.to_csv }

    end

  end

  def new
    @contact = Contact.new
  end

  def edit
  end

  def create
    @contact = Contact.new(contact_params)

    respond_to do |format|
      if @contact.save
        format.html { redirect_to @contact, notice: 'Contact was successfully created.' }
        format.json { render :show, status: :created, location: @contact }
      else
        format.html { render :new }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to @contact, notice: 'Contact was successfully updated.' }
        format.json { render :show, status: :ok, location: @contact }
      else
        format.html { render :edit }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url, notice: 'Contact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


    # - gets called via POST (form) in app/views/contacts/index.html.erb
    #   + POST from multiple check_box_tag 
    # - goes through array params['hide'] of Contact id's
    # - sets Contact.deactivate to true 
  def deactivate_contact 

    to_hide = params['hide']
    go = redirect_to contacts_path

    if !to_hide
      go
    else

     to_hide.each do |i| 
       @contact_to_hide = Contact.find i
       @contact_to_hide.update deactivate: true
     end

     go

    end
  end

    # - gets called via POST (form) in app/views/_deactivated_contact.html.erb
    #   + POST from multiple check_box_tag 
    # - goes through array params['show'] of Contact id's
    # - sets Contact.deactivate to false     
  def reactivate_contact 
    
    to_show = params['show']
    go = redirect_to contacts_url

    if !to_show
      go 
    else
      
      to_show.each do |i|
        @contact_to_show = Contact.find i
        @contact_to_show.update deactivate: false
      end

    end

  end # reactivate_contact

    # - search box at: views/contacts/index.html.erb
    # - user types search string
    # - list of matching Contacts is displayed
    # - reuses #index and @contacts for rendering results
    # - @function
    # -   + rendered in <h1> at app/views/contacts/index.html.erb
  def search_contacts 

    search_term = params['search'][0]

    if search_term.length != 0

      @contacts = Contact.where "name = ?", search_term

      @function = "Search Results"

      render :index

    else
      redirect_to contacts_path
    end

  end  

  private
    def set_contact
      @contact = Contact.find(params[:id])
    end

    def contact_params
      params.require(:contact).permit(:name, :email, :phone, :address, :company, :birtday, :user_id, :format)
    end


end
