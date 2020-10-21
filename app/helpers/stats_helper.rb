module StatsHelper
  include ActionView::Helpers

  def decode_readme(readme)
    return 'No Readme' unless readme

    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML.new, extensions = {})

    markdown.render(
      sanitize(
        Base64.decode64(readme['content']),
        tags: %w[p li ul b strong em a img pre],
        attributes: %w[href src]
      )
    ).html_safe
  rescue StandardError => e
    e.message
    raise
  end
end
