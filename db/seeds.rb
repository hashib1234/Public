User.delete_all
   user = User.new(
      :email                 => "admin@ontash.net",
      :password              => "testpass",
      :password_confirmation => "testpass",
      :role					=> :admin
  )
  user.save!

p "seed for a datatable"
datatable_list = [
  [ "Airi Satou", "Accountant", "Tokyo", 33 , "2008/11/28", "162,700"],
  [ "Ashton Cox", "Junior Technical Author", "San Francisco", 66, "2009/01/12", "86,000" ],
  [ "Cedric Kelly", "Senior Javascript Developer","Edinburgh", 22, "2012/03/29","433,060"],
  [ "Airi Satou", "Accountant","Tokyo",33,"2008/11/28","162,700"],
   ["Brielle Williamson",
                        "Integration Specialist",
                        "New York",
                        61,
                        "2012/12/02",
                        "372,000"],
                      
                      
                        ["Herrod Chandler",
                        "Sales Assistant",
                        "San Francisco",
                        59,
                        "2012/08/06",
                        "137,500"],
                      
                      
                        ["Rhona Davidson",
                        "Integration Specialist",
                        "Tokyo",
                        55,
                        "2010/10/14",
                        "327,900"],
                      
                      
                        ["Colleen Hurst",
                        "Javascript Developer",
                        "San Francisco",
                        39,
                        "2009/09/15",
                        "205,500"],
                      
                      
                        ["Sonya Frost",
                        "Software Engineer",
                        "Edinburgh",
                        23,
                        "2008/12/13",
                        "103,600"],
                      
                      
                        ["Jena Gaines",
                        "Office Manager",
                        "London",
                        30,
                        "2008/12/19",
                        "90,560"],
                      
                      
                       ["Quinn Flynn",
                        "Support Lead",
                        "Edinburgh",
                        22,
                        "2013/03/03",
                        "342,000"],
                      
                      
                        ["Charde Marshall",
                        "Regional Director",
                        "San Francisco",
                        36,
                        "2008/10/16",
                        "470,600"],
                      
                      
                       ["Haley Kennedy",
                        "Senior Marketing Designer",
                        "London",
                        43,
                        "2012/12/18",
                        "313,500"],
                      
                      
                    ["Tatyana Fitzpatrick",
                        "Regional Director",
                        "London",
                        19,
                        "2010/03/17",
                        "385,750"],
                      
                      
                        ["Michael Silva",
                        "Marketing Designer",
                        "London",
                        "66",
                        "2012/11/27",
                        "198,500"],
                      
                      
                        ["Paul Byrd",
                        "Chief Financial Officer (CFO)",
                        "New York",
                        64,
                        "2010/06/09",
                        "725,000"],
                      
                      
                        ["Gloria Little",
                        "Systems Administrator",
                        "New York",
                        59,
                        "2009/04/10",
                        "237,500"],
                      
                      
                        ["Bradley Greer",
                        "Software Engineer",
                        "London",
                        41,
                        "2012/10/13",
                        "132,000"],
                      
                      
                        ["Dai Rios",
                        "Personnel Lead",
                        "Edinburgh",
                        35,
                        "2012/09/26",
                        "217,500"],
                      
                      
                        ["Jenette Caldwell",
                        "Development Lead",
                        "New York",
                        30,
                        "2011/09/03",
                        "345,000"],
                      
                      
                        ["Yuri Berry",
                        "Chief Marketing Officer (CMO)",
                        "New York",
                        40,
                        "2009/06/25",
                        "675,000"],
]
datatable_list.each do |name,position,office,age,start_date,salary|
  p = DataTable.create(:name => name, :position => position, :office => office,
                     :age => age, :start_date => start_date,
                     :salary => salary )
    p.save
  end
                      
                      
                      
                      
               
                       
                
                      
                        
                      
                    