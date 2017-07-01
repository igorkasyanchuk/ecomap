class Admin::PagesController < Admin::ApplicationController
  add_breadcrumb :index, :admin_pages_path

  def index
    @pages = Page.page(params[:page])
  end

  def new
    add_breadcrumb :new
    @page = Page.new
  end

  def create
    @page = Page.new(page_params)

    if @page.save
      redirect_to admin_pages_path, notice: t('crud.created', subject: resource_name) 
    else
      render :new
    end
  end

  def edit
    add_breadcrumb :edit
    @page = resource
  end

  def update
    @page = resource

    if @page.update(page_params)
      redirect_to admin_pages_path, notice: t('crud.updated', subject: resource_name) 
    else
      render :edit
    end
  end

  def destroy
    @page = resource
    @page.destroy

    redirect_back(fallback_location: admin_pages_path, notice: t('crud.deleted', subject: resource_name))
  end

  private

  def resource
    @page = Page.friendly.find(params[:id])
  end

  def page_params
    params.require(:page).permit(:identifier, :content, :position, :title)
  end

  def resource_name
    Page.model_name.human
  end
end
