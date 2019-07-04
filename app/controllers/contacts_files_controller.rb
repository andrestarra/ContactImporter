class ContactsFilesController < ApplicationController
  before_action :find_contacts_file, only: [:show]
  
  def index
    @contacts_files = ContactsFile.all
  end

  def show
  end

  def new
    @contacts_file = ContactsFile.new
  end

  def create
    @contacts_file = ContactsFile.new
    @contacts_file.user_id = current_user.id
    if @contacts_file.save
      redirect_to @contacts_file
    else
      render 'new'
    end
  end

  private

  def contacts_file_params
    params.require(:contacts_file).permit(:csv_file)
  end
  
  def find_contacts_file
    @contacts_file = ContactsFile.find(params[:id])
  end
end
