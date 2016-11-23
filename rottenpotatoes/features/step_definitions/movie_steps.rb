
 Given /the following movies exist/ do |movies_table|
   movies_table.hashes.each do |movie|
     Movie.create!(movie)
   end
 end



 Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
   page.body.should match(/.*#{e1}.*#{e2}/m)
 end

 When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
   rating_list.split(", ").each do |rating|
     if uncheck
       step %{I uncheck "ratings_#{rating}"}
     else
       step %{I check "ratings_#{rating}"}
     end
   end
 end

 Then /I should see all the movies/ do
   page.all('table#movies tr').count.should == Movie.count+1
 end
