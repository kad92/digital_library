class AdminUsers::ManageInventoriesController < ApplicationController
  before_action :authenticate_admin_user!

  def index

  end
end
