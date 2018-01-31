require "spec_helper"

describe 'index', type: :feature do
  before do
    visit '/'
  end

  it 'has the correct section class' do
    expect(page).to have_selector('section', class: 'home')
  end
end
