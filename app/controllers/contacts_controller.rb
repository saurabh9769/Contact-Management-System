class ContactsController < ApplicationController

	before_action :authenticate_user!

	def index
		@contacts = current_user.contacts
	end

	def show
		@contact = Contact.find(params[:id])
	end

	def new
		@contact = Contact.new
	end

	def create
		@contact = current_user.contacts.create(contact_params)
  	@contact.save
		flash.notice = "Contact '#{@contact.first_name}' Created Successfully!"
  	redirect_to contact_path(@contact)
	end

	def edit
  	@contact = Contact.find(params[:id])
	end

	def update
	  @contact = Contact.find(params[:id])
	  @contact.update(contact_params)
    flash.notice = "Contact '#{@contact.first_name}' Updated Successfully!"
	  redirect_to contact_path(@contact)
	end

	def destroy
		@contact = Contact.find(params[:id])
		@contact.destroy
		flash.notice = "Contact '#{@contact.first_name}' Deleted Successfully!"
		redirect_to contacts_path
	end

	# def view_friends
	# 	@users = User.all
	# end

	private

	def contact_params
  	params.require(:contact).permit(:first_name, :last_name, :number, :email_id)
	end

end
