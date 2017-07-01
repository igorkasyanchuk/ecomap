class Admin::ProblemCategoriesController < Admin::ApplicationController
  add_breadcrumb :index, :admin_problem_categories_path
  
  def index
    @problem_categories = ProblemCategory.page(params[:page])
  end

  def new
    add_breadcrumb :new
    @problem_category = ProblemCategory.new
  end

  def create
    @problem_category = ProblemCategory.new(problem_category_params)

    if @problem_category.save
      redirect_to admin_problem_categories_path, notice: t('crud.created', subject: resource_name)
    else
      render :new
    end
  end

  def edit
    add_breadcrumb :edit
    @problem_category = resource
  end

  def update
    @problem_category = resource

    if @problem_category.update(problem_category_params)
      redirect_to admin_problem_categories_path, notice: t('crud.updated', subject: resource_name)
    else
      render :edit
    end
  end

  def destroy
    @problem_category = resource
    @problem_category.destroy

    redirect_back(fallback_location: admin_problem_categories_path, notice: t('crud.deleted', subject: resource_name))
  end

  private

  def resource
    @problem_category = ProblemCategory.find(params[:id])
  end

  def problem_category_params
    params.require(:problem_category).permit(:name, :marker)
  end

  def resource_name
    ProblemCategory.model_name.human
  end
end
