require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do

  it "get top" do
    get :top
    expect(response.status).to eq(200)
  end

end