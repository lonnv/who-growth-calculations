class GenerateLmsLookup
  require 'open-uri'
  require_relative "../models/lms_ref.rb"
  def call(args)
    file_contents = file_to_array_of_arrays(args[:url])
    file_contents_cleaned = sanitize_who_data(file_contents)
    insert_into_db(file_contents_cleaned, args[:is_male], args[:is_in_months])
  end

  def file_to_array_of_arrays(url)
    file_content = open(url).read.gsub("\n", "")
    file_content_by_row = file_content.split("\r")
    file_content_by_row_and_column = file_content_by_row.map{|r| r.split("\t")}
  end

  def sanitize_who_data(data_array)
    #remove header line
    data_array.shift
    data_array.map{|row| row[0..3]} #remove unneccesary data keep only time and lms values
  end

  def insert_into_db(data_array, is_male, is_in_months)
      data_array.each do |row|
        LmsRef.create(male: is_male, time_in_months: is_in_months, time_amount: row[0], l:row[1], m:row[2], s:row[3])
      end
  end

end
