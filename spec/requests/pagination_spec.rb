# frozen_string_literal: true
require "rails_helper"

RSpec.describe "Pagination", type: :feature do
  it "provides page links" do
    login_as create(:cf_admin)

    FactoryGirl.create_list(:developer, 11)
    visit "/developers"

    # 11 created, plus one for the header row
    expect(page.all("tr").count).to eq(12)

    within ".page-sizes" do
      expect(page).to have_link(I18n.t("pagination.per_page_10"), href: "/developers?per=10")
      expect(page).to have_link(I18n.t("pagination.per_page_25"), href: "/developers?per=25")
      expect(page).to have_link(I18n.t("pagination.per_page_50"), href: "/developers?per=50")
      expect(page).to have_link(I18n.t("pagination.per_page_100"), href: "/developers?per=100")
    end

    click_on(I18n.t("pagination.per_page_10"))

    expect(page.all("tr").count).to eq(11)

    within ".pagination" do
      expect(page).to have_link("2", href: "/developers?page=2&per=10")
    end
  end
end
