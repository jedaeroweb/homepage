class ProgramsController < ApplicationController
  before_action :set_program, only: [:show]
  def index
    @controller_name = t(:menu_program)

    @programs = Program.all
    @program_link_category= ProgramLinkCategory.all
  end

  def show
    @controller_name = @program.title
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_program
    @program = Program.find(params[:id])
  end
end