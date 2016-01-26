class BuildsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_action :set_build, only: [:show, :edit, :update, :destroy]

  def index
    @builds = Build.all
  end

  def show
  end

  def new
    @build = Build.new
  end

  def create
    @build = Build.new(build_params)

    if @build.save
      if request.content_type == 'application/json'
        return render json: @build, status: :created, location: @build
      end

      redirect_to @build, notice: 'Build was successfully created.'
    else
      if request.content_type == 'application/json'
        return render json: @build.errors, status: :unprocessable_entity
      end

      render :new
    end
  end

  def destroy
    @build.destroy
    respond_to do |format|
      format.html { redirect_to builds_url, notice: 'Build was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_build
      @build = Build.find(params[:id])
    end

    def build_params
      params.require(:build).permit(:title)
    end
end
