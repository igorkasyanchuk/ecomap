class Admin::PagesController < Admin::BaseController
  def index
    @pages = Page.page(params[:page])
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(page_params)

    if @page.save
      redirect_to admin_pages_path, notice: 'Page was successfully created'
    else
      render :new
    end
  end

  def edit
    @page = resource
  end

  def update
    @page = resource

    if @page.update(page_params)
      redirect_to admin_pages_path, notice: 'Page was successfully updated'
    else
      render :edit
    end
  end

  def destroy
    @page = resource
    @page.destroy

    redirect_back(fallback_location: admin_pages_path, notice: 'Page was successfully deleted')
  end

  private

  def resource
    @page = Page.friendly.find(params[:id])
  end

  def page_params
    params.require(:page).permit(:identifier, :content, :position, :title)
  end
end
