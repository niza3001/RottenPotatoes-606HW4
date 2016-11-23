FactoryGirl.define do
  factory :StarWars, :class => "Movie" do
  	title 'Star Wars'
     rating 'PG'
     director 'George Lucas'
     release_date '1977-05-25'

     factory :THX1138 do
     	title 'THX-1138'
         rating 'R'
         release_date '1971-03-11'
     end
   end

   factory :BladeRunner, :class => "Movie" do
     title 'Blade Runner'
     rating 'R'
     director 'Ridley Scott'
     release_date '1982-06-25'
   end

   factory :Alien, :class => "Movie" do
     title 'Alien'
     rating 'R'
     director ''
     release_date '1979-05-25'
   end
 end
