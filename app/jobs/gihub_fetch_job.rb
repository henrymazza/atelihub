require 'octokit'

class GihubFetchJob < ApplicationJob
  include SuckerPunch::Job
  workers 2

  queue_as :default

  def perform(lang)
    client = Octokit::Client.new(client_id: ENV['GITHUB_CLIENT_ID'],
                                 client_secret: ENV['GITHUB_CLIENT_SECRET'])

    top_repos = client.search_repositories("language:#{lang.name}")[:items]
    top_repos.each do |repo|
      ActiveRecord::Base.connection_pool.with_connection do
        Repository.create! name: repo.name,
                           full_name: repo.full_name,
                           language: lang,
                           owner: repo[:owner].to_h,
                           readme: client.readme(repo.full_name).try(:to_h),
                           details: repo.to_h
      end

    rescue StandardError => e
      Rails.logger.info "[ERROR]: #{e.message}"
      raise
    end
  end
end
