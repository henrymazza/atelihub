require 'rails_helper'

RSpec.describe 'stats/index.html.erb', type: :view do
  let(:lang_1) { Language.first }
  let(:lang_2) { Language.last }
  let(:repo_1) { lang_1.repositories.first }
  let(:repo_2) { lang_1.repositories.last }

  before do
    create_list(:language, 2, :with_repositories)

    assign(:languages, Language.order('name ASC').all)
  end

  it 'displays all languages names in alphabetical order' do
    render

    names = Language.all.map(&:name).sort.join('.*')

    expect(rendered).to match(Regexp.new(names, Regexp::MULTILINE))
  end

  it 'displays repository name' do
    render

    expect(rendered).to match(repo_1.name)
  end
end
