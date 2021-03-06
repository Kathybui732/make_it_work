require "rails_helper"

RSpec.describe "Contestants index page" do
	before :each do
    @challenge = Challenge.create!(theme: "Apartment Furnishings", project_budget: 320)
    @contestant_1 = Contestant.create(name: "Kathy", age: 27, hometown: "Denver", years_of_experience: 0)
    @contestant_2 = Contestant.create(name: "Justin", age: 27, hometown: "Denver", years_of_experience: 20)

    @litfit = @contestant_1.projects.create!(name: "Litfit", material: "Lamp Shade", challenge: @challenge)
    @rug = @contestant_1.projects.create!(name: "Rug Tuxedo", material: "Rugs", challenge: @challenge)
    @leather = @contestant_2.projects.create!(name: "LeatherFeather", material: "Leather", challenge: @challenge)
	end

  it "should display a list of all contestant names and the projects they have been on" do
    visit "/contestants"
		within(".contestants-#{@contestant_1.id}") do
			expect(page).to have_content(@contestant_1.name)
			expect(page).to have_content(@litfit.name)
			expect(page).to have_content(@rug.name)
		end

		within(".contestants-#{@contestant_2.id}") do
	    expect(page).to have_content(@contestant_2.name)
	    expect(page).to have_content(@leather.name)
		end
  end
end
