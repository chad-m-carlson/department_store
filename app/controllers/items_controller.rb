class ItemsController < ApplicationController
  # before_action :set_department #SETS DEPARTMENT FOR ALL CRUD ACTIONS


  def index
    @department = Department.find(params[:department_id])
    @items = @department.items
  end

  def show
    @department = Department.find(params[:department_id])
    @item = Item.find(params[:id])
  end

  def new
    @department = Department.find(params[:department_id])
    @item = @department.items.new
    # @topic = @sub.topics.new
    render partial: 'form'
  end

  def create
    @department = Department.find(params[:department_id])
    @item = @department.items.new(params.require(:item).permit(:name, :description, :price))
    if @item.save
      redirect_to department_items_path(@department, @item)
    else
      render :new
    end
  end

  def edit
    @department = Department.find(params[:department_id])
    @item = Item.find(params[:id])
    render partial: "form"
  end

  def update
    @department = Department.find(params[:department_id])
    @item = Item.find(params[:id])
    if @item.update(params.require(:item).permit(:name, :description, :price))
      redirect_to department_items_path(@department, @item)
    else
      render partial: "form"
    end
  end 

  def destroy
    @department = Department.find(params[:department_id])
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to department_items_path(@department)
  end 

  private

    def set_department
      @department = Department.find(params[:department_id])
    end


end

