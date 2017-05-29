class Admin::ProblemsController < Admin::BaseController
  def index
    @problems = Problem.page(params[:page])
  end

  def new
    @problem = Problem.new
  end

  def create
    @problem = Problem.new(problem_params)

    if @problem.save
      redirect_to admin_problem_categories_path, notice: 'Problem was successfully created'
    else
      render :new
    end
  end

  def edit
    @problem = resource
  end

  def update
    @problem = resource

    if @problem.update(problem_params)
      redirect_to admin_problem_categories_path, notice: 'Problem was successfully updated'
    else
      render :edit
    end
  end

  def destroy
    @problem = resource
    @problem.destroy

    redirect_back(fallback_location: admin_problem_categories_path, notice: 'Problem was successfully deleted')
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
end
