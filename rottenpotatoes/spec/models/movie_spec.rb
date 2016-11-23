require 'spec_helper'

 describe Movie do

   before(:each) do
     @attr = {
       :title => "Star Wars",
       :rating => "PG",
       :director => "George Lucas",
       :release_date => "1977-05-25"
     }
     @Alien = FactoryGirl.create(:Alien)
     @StarWars = FactoryGirl.create(:StarWars)
     @THX1138 = FactoryGirl.create(:THX1138)
     @BladeRunner = FactoryGirl.create(:BladeRunner)
   end

   it "should create a new instance given a valid attribute" do
     Movie.create!(@attr)
   end

   it "function should return movies of same director" do
     @StarWars.same_director.should include(@THX1138)
   end

   it "function should return movies of same director" do
     @StarWars.same_director.should_not include(@BladeRunner)
   end

   it "rating should be valid" do
     Movie.all_ratings.to_a.should include(@StarWars.rating)
   end
 end
