class FileRecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_file_record, only: [:destroy, :share]

  def index
    @file_records = current_user.file_records
  end

  def new
    @file_record = FileRecord.new
  end

  def create
    @file_record = current_user.file_records.new(file_record_params)
    if @file_record.save
      redirect_to file_records_path, notice: "File uploaded successfully"
    else
      render :new
    end
  end

  def destroy
    @file_record.destroy
    redirect_to file_records_path, notice:  "File deleted successfully"
  end

  def share
    @file_record = current_user.file_records.find(params[:id])
    @file_record.generate_public_token unless @file_record.public_token.present?

    respond_to do |format|
      format.json { render json: { public_url: public_file_url(@file_record.public_token) } }
    end
  end

  def public_show
    @file_record = FileRecord.find_by(public_token: params[:token])
    if @file_record&.file&.attached?
      redirect_to rails_blob_path(@file_record.file, disposition: "inline")
    else
      render plain: "Invalid or expired link", status: :not_found
    end
  end

  private

  def set_file_record
    @file_record = current_user.file_records.find(params[:id])
  end

  def file_record_params
    params.require(:file_record).permit(:title, :description, :file)
  end
end
