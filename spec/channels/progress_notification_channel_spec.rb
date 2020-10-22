require 'rails_helper'

RSpec.describe ProgressNotificationChannel, type: :channel do
  include ActionCable::TestHelper

  before do
    stub_connection
  end

  it 'successfully subscribes' do
    subscribe
    expect(subscription).to be_confirmed
  end
end
