class CohortColumnOptionsController < ApplicationController
  include CohortAuthorization
  before_action :require_can_manage_cohorts!
  before_action :set_cohort_column_option, only: [:edit, :update]
  before_action :set_cohort_column_options, only: [:index, :create]
  
  def index
    @cohort_column_options = @cohort_column_options.order(cohort_column: :desc).page(params[:page]).per(25)
  end
  
  def new
    @cohort_column_option = cohort_column_option_source.new 
  end 
  
  def create
    @cohort_column_option = cohort_column_option_source.create(cohort_column_option_params)
    respond_with(@cohort_column_option, location: cohort_column_options_path)
  end
  
  def edit
    
  end

  def update
    @event.update(administrative_event_params)
    respond_with(@event, location: admin_administrative_events_path)
  end

  def set_cohort_column_option
    @cohort_column_option = cohort_column_option_source.find(params[:cohort_column_option_id].to_i)
  end
  
  def set_cohort_column_options
    @cohort_column_options = cohort_column_option_source.all
  end
  
  def cohort_column_option_source
    GrdaWarehouse::CohortColumnOption
  end
  
  def flash_interpolation_options
    { resource_name: 'Cohort Column Option' }
  end
  
  private
    def cohort_column_option_params
      params.require(:grda_warehouse_cohort_column_option).permit(
        :cohort_column, 
        :value,
        :weight,
        :active,
      )
    end
    

end
