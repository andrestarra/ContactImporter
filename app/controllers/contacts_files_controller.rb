class ContactsFilesController < ApplicationController
  before_action :find_contacts_file, except: %i[index new create proccess]

  def index
    @contacts_files = ContactsFile.my_contacts_files(current_user)
  end

  def show
    file_content = @contacts_file.csv_file.download
    @table = CSV.parse(file_content, headers: false)
  end

  def proccess
    @contacts_file = ContactsFile.find(params[:contacts_file_id])
    index = @contacts_file.field_column
    file_content = @contacts_file.csv_file.download
    CSV.parse(file_content, headers: true) do |row|
      contact = Contact.new
      contact.name = row[index.name]
      contact.birthdate = row[index.birthdate]
      contact.phone_number = row[index.phone_number]
      contact.address = row[index.address]
      contact.credit_card = row[index.credit_card]
      contact.email = row[index.email]
      contact.user_id = current_user.id
      contact.save
    end
    redirect_to contacts_file_path(@contacts_file)
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
