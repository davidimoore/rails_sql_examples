FactoryGirl.define do
  factory :country do
    code "MyText"
    name "MyText"
    continent "MyText"
    region "MyText"
    surface_area 1.5
    indep_year 1
    population 1
    life_expectancy 1.5
    gnp 1.5
    gnp_old 1.5
    local_name "MyText"
    government_form "MyText"
    head_of_state "MyText"
    capital 1
    code_2 "MyText"
    
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
    
    factory :afganistan do
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
  end
  
end
