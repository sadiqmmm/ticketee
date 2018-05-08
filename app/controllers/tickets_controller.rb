# frozen_string_literal: true

class TicketsController < ApplicationController
  before_action :set_project
  before_action :set_ticket, only: %i[show edit update destroy]

  def index; end

  def new
    @ticket = @project.tickets.build
  end

  def create
    @ticket = @project.tickets.build(ticket_params)
    if @ticket.save
      flash[:notice] = 'Ticket Saved Successfully.'
      redirect_to project_ticket_path(@project, @ticket)
    else
      flash.now[:notice] = "Can't save"
      render 'new'
    end
  end

  private

  def ticket_params
    params.require(:ticket).permit(:name, :description)
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_ticket
    @ticket = @project.tickets.find(params[:id])
  end
end
