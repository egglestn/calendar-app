# frozen_string_literal: true
require "rails_helper"

RSpec.describe "Navigation", type: :feature do
  it "only adds active link to the current page nav link" do
    login_as create(:cf_admin)

    visit "/developers"

    within ".navbar-menu" do
      active_links = find_all ".active"

      expect(active_links.count).to eq(1)
      expect(active_links.first.text).to eq("Developers")
    end
  end
end
