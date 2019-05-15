class DepartmentsController < ApplicationController
  def index
    @departments = Department.all
  end

  def show
    @department = Department.find(params[:id])
  end

  def new
    @department = Department.new
    render partial: "form"
  end

  def create
    @department = Department.new(params.require(:department).permit(:name, :description))
    if @department.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @department = Department.find(params[:id])
    render partial: "form"
  end

  def update
    @department = Department.find(params[:id])
    if @department.update(params.require(:department).permit(:name, :description))
      redirect_to department_path
    else
      render partial: "form"
    end
  end

  def destroy
    @department = Department.find(params[:id]).destroy
    redirect_to departments_path
  end

end
