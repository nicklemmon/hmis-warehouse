###
# Copyright 2016 - 2019 Green River Data Analysis, LLC
#
# License detail: https://github.com/greenriver/hmis-warehouse/blob/master/LICENSE.md
###

class Users::InvitationsController < Devise::InvitationsController
  prepend_before_action :require_can_edit_users!, only: [:new, :create]
  include ViewableEntities

  # GET /resource/invitation/new
  def new
    @user = User.new
  end

  def confirm
    @user = User.new
    if ! creating_admin?
      create
    end
  end

  # POST /resource/invitation
  def create
    if creating_admin?
      if ! current_user.valid_password?(confirmation_params[:confirmation_password])
        flash[:error] = "User not updated. Incorrect password"
        @user = User.new
        render :confirm
        return
      end
    end

    if User.with_deleted.find_by_email(invite_params[:email]).present?
      @user = User.with_deleted.find_by_email(invite_params[:email]).restore
    end
    @user = User.invite!(invite_params, current_user)
    @user.set_viewables viewable_params if @user

    if resource.errors.empty?
      if is_flashing_format? && self.resource.invitation_sent_at
        set_flash_message :notice, :send_instructions, :email => self.resource.email
      end
      redirect_to admin_users_path
    else
      render :new
    end
  end

  # GET /resource/invitation/accept?invitation_token=abcdef
  def edit
    super
  end

  # PUT /resource/invitation
  def update
    super
  end

  # GET /resource/invitation/remove?invitation_token=abcdef
  def destroy
    super
  end

  private

    def invite_params
      params.require(:user).permit(
        :last_name,
        :first_name,
        :email,
        :phone,
        :agency,
        :receive_file_upload_notifications,
        :notify_on_vispdat_completed,
        :notify_on_client_added,
        :notify_on_anomaly_identified,
        role_ids: [],
        coc_codes: [],
        contact_attributes: [:id, :first_name, :last_name, :phone, :email, :role]
        )
    end

    def viewable_params
      params.require(:user).permit(
        data_sources: [],
        organizations: [],
        projects: [],
        reports: [],
        cohorts: []
      )
    end

    def confirmation_params
      params.require(:user).permit(
        :confirmation_password
      )
    end

    def creating_admin?
      role_ids = invite_params[:role_ids]&.select{|v| v.present?}&.map(&:to_i) || []
      role_ids.each do |id|
        role = Role.find(id)
        if role.administrative?
          @admin_role_name = role.name.humanize
          return true
        end
      end
      return false
    end

end

