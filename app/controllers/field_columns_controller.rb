class FieldColumnsController < ApplicationController
  def create
    @contacts_file = ContactsFile.find(params[:contacts_file_id])
    if @field_column = @contacts_file.create_field_column(field_column_params)
      flash[:notice] = 'Field Column successfully created'
    else
      flash[:alert] = 'Field Column not be created'
    end
    redirect_to contacts_file_path(@contacts_file, headers: true)
  end

  private

  def field_column_params
    params.require(:field_column).permit(:name, :birthdate, :phone_number,
                                         :address, :credit_card, :email)
  end
end
