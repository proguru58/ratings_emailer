class TemplatesController < ApplicationController
  before_action :find_template, only: [:edit, :update, :show, :delete]
  before_action :subscription_required

  # Index action to render all templates
  def index
    @templates = current_user.templates
  end

  # New action for creating template
  def new
    @template = Template.new
  end

  # Create action saves the template into database
  def create
    @template = Template.new
    @template.user = current_user
    if @template.update(template_params)
      flash[:notice] = "Successfully created template!"
      redirect_to template_path(@template)
    else
      flash[:alert] = "Error creating new template!"
      render :new
    end
  end

  # Edit action retrives the template and renders the edit page
  def edit
  end

  # Update action updates the template with the new information
  def update
    if @template.update_attributes(template_params)
      flash[:notice] = "Successfully updated template!"
      redirect_to template_path(@template)
    else
      flash[:alert] = "Error updating template!"
      render :edit
    end
  end

  # The show action renders the individual template after retrieving the the id
  def show
  end

  # The destroy action removes the template permanently from the database
  def destroy
    if @template.destroy
      flash[:notice] = "Successfully deleted template!"
      redirect_to templates_path
    else
      flash[:alert] = "Error updating template!"
    end
  end

  def fetch
    respond_to do |format|
      template = current_user.templates.find(params[:template_id])
      if
        format.json { render json: template }
      else
        format.json { render json: '', status: :unprocessable_entity }
      end
    end
  end

  private

  def template_params
    params.require(:template).permit(:title, :body)
  end

  def find_template
    @template = Template.find(params[:id])
  end
end