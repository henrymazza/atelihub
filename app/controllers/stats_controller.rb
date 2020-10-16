class StatsController < ApplicationController
  def index
    flash.notice = nil
    @languages = Language.includes(:repositories)
                         .order('languages.name ASC')
                         .order(Arel.sql("repositories.details -> 'forks' DESC"))
  end

  def refresh
    Language.destroy_all

    ENV['LANGS'].split(',').map(&:strip).each do |lang_name|
      l = Language.create name: lang_name
      GihubFetchJob.perform_later(l)
    end

    sleep 2 # avoid running out of connections in production

    flash[:alert] = 'Repositories refresh scheduled.'
    redirect_to action: :index
  rescue StandardError => e
    render html: "Error: #{e.message}".html_safe
  end

  def clear
    Repository.delete_all
    Language.delete_all

    flash[:alert] = 'All repositories were cleared'
    redirect_to action: :index
  rescue StandardError => e
    render html: "Error: #{e.message}".html_safe
  end
end
