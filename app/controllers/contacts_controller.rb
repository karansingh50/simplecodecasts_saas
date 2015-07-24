class ContactsController < ApplicationController
     
 def new
   @flash1 = Hash.new
#  @flash1[:success] = 'sds'
   @contact = Contact.new
 end
 
 def thanks
 end
 
 #def create
  # @contact = Contact.new(contact_params)
 
   #if @contact.save
  
    # @myarray = {:status => "success"};
     # redirect_to new_contact_path
     
   #else 
    # @myarray = {:status => "failure"};
     #redirect_to new_contact_path
   #end
  
 #end
def create
  @contact = Contact.new(contact_params)
    @flash1 = Hash.new
    if(Contact.find_by_email(@contact.email))
      if(@contact.email == Contact.find_by_email(@contact.email).email)
  redirect_to new_contact_path(:something => "else")
  return
      end

    end

  if @contact.save
    name = params[:contact][:name]
    email = params[:contact][:email]
    body = params[:contact][:comments]
    ContactMailer.contact_email(name, email, body).deliver
    @flash1[:success] = 'Message sent.'
   redirect_to contact_path(:id => @contact.id) 
  else
   @flash1[:success] = 'Error occured, message has not been sent.'
    redirect_to :action => :show
  end
 
end



def show
  @user = Contact.find(params[:id]);
end

def check_email
 puts params[:email]
@userr = Contact.find_by_email(params[:contact][:email])

respond_to do |format|
#format.html { render(:text => !@userr) }
format.json { render :json => !@userr }
end
end



 private  
 def contact_params
  params.require(:contact).permit(:name, :email, :commets)
 end
    
end
