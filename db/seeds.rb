return if Company.find_by(name: "Test Company").present?
require_relative 'seeds/test_data'
TestData.create