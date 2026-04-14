class StaticController < ApplicationController
  def index
    # Set default categories
    %i(topics maintenance updates developers).each do |category|
      params[category] ||= '1'
    end

    flash[:error] = I18n.t('alerts.lodestone_ban')
  end
end
