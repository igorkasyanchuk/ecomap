class Admin::ProblemsController < Admin::ApplicationController
  add_breadcrumb :index, :admin_problems_path

  def index
    @problems = Problem.page(params[:page])
  end

  def show
    add_breadcrumb resource.to_s
  end

  def new
    add_breadcrumb :new
    @problem = Problem.new
  end

  def create
    @problem = Problem.new(problem_params)

    if @problem.save
      redirect_to admin_problems_path, notice: t('crud.created', subject: resource_name)
    else
      render :new
    end
  end

  def edit
    add_breadcrumb :edit
    @problem = resource
  end

  def update
    @problem = resource

    if @problem.update(problem_params)
      redirect_to admin_problems_path, notice: t('crud.updated', subject: resource_name)
    else
      render :edit
    end
  end

  def destroy
    @problem = resource
    @problem.destroy

    redirect_to admin_problems_path, notice: t('crud.deleted', subject: resource_name)
  end

  private

  def resource
    @problem = Problem.find(params[:id])
  end

  def problem_params
    params.require(:problem).permit(
      :title, :description, :solution, :lat, :lng, :problem_category_id, 
      :moderated, :solved, :likes, :user_id, :stars
    )
  end

  def resource_name
    Problem.model_name.human
  end
end
