class ContactsFilesController < ApplicationController
  before_action :find_contacts_file, except: %i[index new create]

  def index
    @contacts_files = ContactsFile.all
  end

  def show
  end

  def new
    @contacts_file = ContactsFile.new
  end

  def create
    @contacts_file = ContactsFile.new(contacts_file_params)
    @contacts_file.user_id = current_user.id

    if @contacts_file.save
      redirect_to @contacts_file
    else
      render 'new'
    end
  end

  def destroy
    @contacts_file.destroy
    redirect_to contacts_files_path
  end

  private

  def contacts_file_params
    params.require(:contacts_file).permit(:csv_file)
  end
  
  def find_contacts_file
    @contacts_file = ContactsFile.find(params[:id])
  end
end
