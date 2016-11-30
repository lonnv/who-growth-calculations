desc "Fetch data from WHO and feed the lms value lookup table"
task feed_lms_table: :environment  do
  require_relative "../../app/services/generate_lms_lookup.rb"
  insert_lms_lookup = GenerateLmsLookup.new

  lms_args = [{url: "http://www.who.int/childgrowth/standards/wfa_girls_0_13_zscores.txt", is_male: false,is_in_months: false},
  {url: "http://www.who.int/childgrowth/standards/wfa_girls_0_5_zscores.txt", is_male: false,is_in_months: true},
  {url: "http://www.who.int/childgrowth/standards/wfa_boys_0_13_zscores.txt", is_male: true, is_in_months: false},
  {url: "http://www.who.int/childgrowth/standards/wfa_boys_0_5_zscores.txt", is_male: true, is_in_months: true}]

  lms_args.each do |args|
    insert_lms_lookup.call(args)
  end

end
