###
# Copyright 2016 - 2019 Green River Data Analysis, LLC
#
# License detail: https://github.com/greenriver/hmis-warehouse/blob/master/LICENSE.md
###

module Clients
  class UsersController < ApplicationController
    include ClientPathGenerator

    before_action :require_can_assign_or_view_users_to_clients!
    before_action :require_can_assign_users_to_clients!, only: [:update, :destroy, :create, :edit]
    before_action :set_client
    before_action :set_user, only: [:edit, :update, :destroy]
    after_action :log_client

    def index
      @user = user_source.new
      @user_clients = @client.user_clients.preload(:user).to_a || []
    end

    def create
      @user = user_source.new(user_client_params.merge(client_id: params[:client_id].to_i))
      begin
        @user.save!
      rescue Exception => e
        @user_clients = @client.user_clients.preload(:user).to_a || []
        flash[:error] = e.message
        render action: :index
        return
      end
      flash[:notice] = 'Relationship added.'
      redirect_to action: :index
    end

    def update
      @user.update(user_client_params)
    end

    def destroy
      if @user.destroy
        flash[:notice] = 'Relationship removed.'
      else
        flash[:error] = "Unable to remove the #{@user.relationship} relationship."
      end
      redirect_to action: :index
    end

    def user_client_params
      params.require(:grda_warehouse_user_client).permit(
        :user_id,
        :client_id,
        :relationship,
        :client_notifications,
        :confidential,
        :start_date,
        :end_date,
      )
    end

    def client_source
      GrdaWarehouse::Hud::Client
    end

    def user_source
      GrdaWarehouse::UserClient
    end

    def user_scope
      user_source
    end

    def set_client
      @client = client_scope.find(params[:client_id].to_i)
    end

    def set_user
      @user = user_scope.find(params[:id].to_i)
    end

    protected def title_for_show
      "#{@client.name} - Relationships"
    end

    private def client_scope
      client_source.destination.where(
        client_source.arel_table[:id].in(
          Arel.sql(
            GrdaWarehouse::WarehouseClient.joins(:source).
              merge(GrdaWarehouse::Hud::Client.searchable_by(current_user)).
              select(:destination_id).to_sql,
          ),
        ).
        or(
          client_source.arel_table[:id].in(Arel.sql(GrdaWarehouse::Hud::Client.searchable_by(current_user).select(:id).to_sql)),
        ),
      )
    end
  end
end
