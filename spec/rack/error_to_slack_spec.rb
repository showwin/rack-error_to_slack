require 'spec_helper'

describe Rack::ErrorToSlack do
  it 'has a version number' do
    expect(Rack::ErrorToSlack::VERSION).not_to be nil
  end

  it 'does something useful' do
    expect(false).to eq(true)
  end
end
