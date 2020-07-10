require 'rails_helper'


RSpec.describe Contestant, type: :model do
  before :each do
    @challenge = Challenge.create!(theme: "Apartment Furnishings", project_budget: 320)
    @challenge = Challenge.create!(theme: "Apartment Furnishings", project_budget: 320)
    @contestant_1 = Contestant.create(name: "Kathy", age: 27, hometown: "Denver", years_of_experience: 0)
    @contestant_2 = Contestant.create(name: "Justin", age: 27, hometown: "Denver", years_of_experience: 20)

    @litfit = Project.create!(name: "Litfit", material: "Lamp Shade", challenge: @challenge)
    @rug = Project.create!(name: "Rug Tuxedo", material: "Rugs", challenge: @challenge)
    @leather = Project.create!(name: "LeatherFeather", material: "Leather", challenge: @challenge)

    ContestantProject.create!(contestant: @contestant_1, project: @litfit)
    ContestantProject.create!(contestant: @contestant_2, project: @litfit)
    ContestantProject.create!(contestant: @contestant_1, project: @rug)
    ContestantProject.create!(contestant: @contestant_2, project: @leather)
  end

  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
    it {should validate_presence_of :hometown}
    it {should validate_presence_of :years_of_experience}
  end

  describe "relationships" do
    it {should have_many :contestant_projects}
    it {should have_many(:projects).through(:contestant_projects)}
  end

  it "#average_years" do
    expect(Contestant.average_years).to eq(10.0)
  end
end
