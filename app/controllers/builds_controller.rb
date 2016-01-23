class BuildsController < ApplicationController
  before_action :set_build, only: [:show, :edit, :update, :destroy]

  def index
    @builds = Build.all
  end

  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_build
      @build = Build.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def build_params
      params.require(:build).permit(:title)
    end
end
