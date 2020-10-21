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
      language = Language.create name: lang_name

      if Rails.env.test?
        GihubFetchJob.perform_later(language)
      else
        GihubFetchJob.perform_async(language)
      end
    end

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
