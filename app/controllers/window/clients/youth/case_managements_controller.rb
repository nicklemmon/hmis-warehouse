module Window::Clients::Youth
  class CaseManagementsController < ApplicationController
    include WindowClientPathGenerator
    include PjaxModalController

    before_action :set_entity, only: [:show, :edit, :update, :destroy]
    before_action :set_client
    after_action :log_client

    def index
    end

    def new
      @entity = entity_source.new(user_id: current_user.id, client_id: @client.id)
    end

    def create
      @entity = entity_source.new(user_id: current_user.id, client_id: @client.id)
      @entity.assign_attributes(entity_params)
      @entity.save!
      respond_with(@entity, location: polymorphic_path(youth_intakes_path_generator))
    end

    def edit
    end

    def update
      @entity.assign_attributes(entity_params)
      @entity.save!
      respond_with(@entity, location: polymorphic_path(youth_intakes_path_generator))
    end

    def destroy
      @entity.destroy
      respond_with(@entity, location: polymorphic_path(youth_intakes_path_generator))
    end

    private def entity_params
      params.require(:entity).permit(
        :engaged_on,
        :activity,
      )
    end

    private def set_entity
      @entity = entity_scope.find(params[:id].to_i)
    end

    def set_client
      @client = GrdaWarehouse::Hud::Client.destination.find(params[:client_id].to_i)
    end

    private def entity_source
      GrdaWarehouse::Youth::YouthCaseManagement
    end

    private def entity_scope
      entity_source.visible_by?(current_user)
    end

    def flash_interpolation_options
      { resource_name: 'Youth Case Management' }
    end
  end
end