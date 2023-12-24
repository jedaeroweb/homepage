class ProgramsController < ApplicationController
  def index
    @controller_name = t(:menu_program)

    @programs = Program.all
  end

  def install

  end
end