class SubscriptionsController < ApplicationController
  before_action :authenticate_user!

  def create
    @subscription = Subscription.create(user_id: current_user.id, feed_id: params[:feed_id])
    redirect_to feeds_path
  end

  def destroy
    current_user.subscriptions.find(params[:id]).destroy
    redirect_to feeds_path
  end
end
