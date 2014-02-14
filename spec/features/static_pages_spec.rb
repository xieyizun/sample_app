require 'spec_helper'

describe "Static pages" do
  subject { page }
  
  describe "Home page" do
    before { visit root_path }

    it { should have_content('Sample App') }
  	it { should have_title(full_title(' | Home'))}
    it "should have the right link" do
      click_link "Home"
      expect(page).to have_title(full_title(' | Home'))
    end
  end

  describe "Help page" do
    before { visit help_path }

    it { should have_content('Help') }
    it { should have_title(full_title(' | Help'))}
    it "should have the right link" do
      click_link "Help"
      expect(page).to have_title(full_title(' | Help'))
    end
  end

  describe "About page" do
    before { visit about_path }

    it { should have_content('About us') }
  	it { should have_title(full_title(' | About'))}
    it "shoudl have the right link" do
      click_link "About"
      expect(page).to have_title(full_title(' | About'))
    end
  end

  describe "Contact us" do
    before { visit contact_path }
    it { should have_content('Contact us') }
    it { should have_title(full_title(' | Contact'))}
    it "should have the right link" do
      click_link "Contact"
      expect(page).to have_title(full_title(' | Contact'))
    end
  end

end