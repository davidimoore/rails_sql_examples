FactoryGirl.define do
  factory :country do
    name "Country of Factory"

    factory :netherlands do
        code "NLD"
        name "Netherlands"
        continent "Europe"
        region "Western Europe"
        surface_area 41526.0
        indep_year 1581
        population 15864000
        life_expectancy 78.3
        gnp 371362.0
        gnp_old 360478.0
        local_name "Nederland"
        government_form "Constitutional Monarchy"
        head_of_state "Beatrix"
        capital 5
        code_2 "NL"
    end
    
    factory :afghanistan do
       code "AFG"
        name "Afghanistan"
        continent "Asia"
        region "Southern and Central Asia"
        surface_area 652090.0
        indep_year 1919
        population 22720000
        life_expectancy 45.9
        gnp 5976.0
        gnp_old nil
        local_name "Afganistan/Afqanestan"
        government_form "Islamic Emirate"
        head_of_state "Mohammad Omar"
        capital 1
        code_2 "AF"
      
    end
    
    factory :china do
      code "CHN"
      name "China"
      continent "Asia"
      region "Eastern Asia"
      surface_area 9572900.0
      indep_year -1523
      population 1277558000
      life_expectancy 71.4
      gnp 982268.0
      gnp_old 917719.0
      local_name "Zhongquo"
      government_form "People's Republic"
      head_of_state "Jiang Zemin"
      capital 1891
      code_2 "CN"

    end
    
    factory :antarctica do
      code "ATA"
      name "Antarctica"
      continent "Antarctica"
      region "Antarctica"
      surface_area 13120000.0
      population 0
      gnp 0.0
      local_name ""
      government_form "Co-administrated"
      head_of_state ""
      code_2 "AQ"

    end
    
    factory :french_guiana do
      code "GUF"
      name "French Guiana"
      continent "South America"
      region "South America"
      surface_area 90000.0
      indep_year nil
      population 181000
      life_expectancy 76.1
      gnp 681.0
      gnp_old nil
      local_name "Guyane française"
      government_form "Overseas Department of France"
      head_of_state "Jacques Chirac"
      capital 3014
      code_2 "GF"
    end
    
    factory :french_polynesia do
      code "PYF"
      name "French Polynesia"
      continent "Oceania"
      region "Polynesia"
      surface_area 4000.0
      indep_year nil
      population 235000
      life_expectancy 74.8
      gnp 818.0
      gnp_old 781.0
      local_name "Polynésie française"
      government_form "Nonmetropolitan Territory of France"
      head_of_state "Jacques Chirac"
      capital 3016
      code_2 "PF"

    end
  end
  
end
