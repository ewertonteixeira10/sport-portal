require 'rails_helper'

describe 'Event Rankings', type: :feature do

  before(:each) do
    @user = FactoryBot.create :user
  end

  let(:valid_league_attributes) {
    FactoryBot.build(:league, owner: @user, max_teams: 20, game_mode: League.game_modes[:round_robin]).attributes
  }

  describe "for Leagues" do
    it 'should render without an error' do
      league = League.create! valid_league_attributes
      visit leagues_ranking_path(league)
    end
  end
end
