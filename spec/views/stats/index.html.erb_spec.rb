require 'rails_helper'

RSpec.describe 'stats/index.html.erb', type: :view do
  before do
    create_list(:language, 10, :with_repositories)

    assign(:languages, Language.order('name ASC').all)
  end

  it 'displays all language names' do
    render

    names = Language.all.map(&:name).map do |lang|
      "(?=.*#{Regexp.escape(lang)})"
    end.join('')

    expect(rendered).to match(Regexp.new(names, Regexp::MULTILINE))
  end

  it 'displays all repository names' do
    render

    names = Repository.all.map(&:name).map do |repo|
      "(?=.*#{Regexp.escape(repo)})"
    end.join('')

    expect(rendered).to match(Regexp.new(names, Regexp::MULTILINE))
  end
end
