class Admin::ProblemCategoriesController < Admin::BaseController
  def index
    @problem_categories = ProblemCategory.page(params[:page])
  end

  def new
    @problem_category = ProblemCategory.new
  end

  def create
    @problem_category = ProblemCategory.new(problem_category_params)

    if @problem_category.save
      redirect_to admin_problem_categories_path, notice: 'Problem Category was successfully created'
    else
      render :new
    end
  end

  def edit
    @problem_category = resource
  end

  def update
    @problem_category = resource

    if @problem_category.update(problem_category_params)
      redirect_to admin_problem_categories_path, notice: 'Problem Category was successfully updated'
    else
      render :edit
    end
  end

  def destroy
    @problem_category = resource
    @problem_category.destroy

    redirect_back(fallback_location: admin_problem_categories_path, notice: 'Problem Category was successfully deleted')
  end

  private

  def resource
    @problem_category = ProblemCategory.find(params[:id])
  end

  def problem_category_params
    params.require(:problem_category).permit(:name, :marker)
  end
end
