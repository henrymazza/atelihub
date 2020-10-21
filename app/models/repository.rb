class Repository < ApplicationRecord
  belongs_to :language, touch: true
  validates :language, presence: true
  validates :owner, presence: true
  validates :readme, presence: true

  def decoded_readme
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML.new, extensions = {})

    markdown.render Base64.decode64(readme['content'])
  rescue StandardError => e
    e.message
  end
end
