class ImportsController < ApplicationController
  before_action :set_import, only: [:edit, :update, :destroy, :start]

  def index
    @imports = Import.all
  end

  def new
    @import = Import.new
  end

  def create
    @import = Import.new(import_params)
    if @import.save
      redirect_to action: :index
    else
      render :new
    end
  end

  def start
    begin
      @import.parse_file
    rescue CSV::MalformedCSVError => e
      error = "Some problem appeared csv #{e}"
    else
      ProductFeed.create_records(@import.parse_file)
    end

    if error.nil?
       @import.finished
      redirect_to imports_path
    else
      flash[:notice] = error
      redirect_to imports_path
    end
  end

  def update
    respond_to do |format|
      if @import.update(import_params)
        format.html { redirect_to @import, notice: 'Import was successfully updated.' }
        format.json { render :show, status: :ok, location: @import }
      else
        format.html { render :edit }
        format.json { render json: @import.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @import.destroy
    respond_to do |format|
      format.html { redirect_to imports_url, notice: 'Import was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_import
    @import = Import.find(params[:id])
  end

  def import_params
    params
      .require(:import)
      .permit(
        :title,
        :file
      )
  end
end
