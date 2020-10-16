require 'octokit'

class GihubFetchJob < ApplicationJob
  queue_as :default

  def perform(lang)
    client = Octokit::Client.new(client_id: ENV['GITHUB_CLIENT_ID'],
                                 client_secret: ENV['GITHUB_CLIENT_SECRET'])

    top_repos = client.search_repositories("language:#{lang.name}")[:items]
    top_repos.each do |repo|
      Repository.create! name: repo.name,
                         full_name: repo.full_name,
                         language: lang,
                         owner: repo[:owner].to_h,
                         readme: client.readme(repo.full_name).to_h,
                         details: repo.to_h

    rescue StandardError => e
      # FIXME
      # binding.pry
    end
  end
end
