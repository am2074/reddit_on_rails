class VotesController < ApplicationController
  before_action :authenticate_user!
  before_action :identify_object

  def up
    @object.liked_by current_user
    redirect_back fallback_location: root_path # redirect to @object if you want
  end

  def down
    @object.downvote_from current_user
    redirect_back fallback_location: root_path# redirect to @object if you want
  end

  private

  def identify_object
    type = params[:object]
    @object = type.constantize.find(params[:id])
  end
end