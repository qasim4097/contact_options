require_relative "contact_options"
require "test/unit"

class TestContactOption < Test::Unit::TestCase

	def setup
		@data = [
			{
				name: 'John Doe',
				email: 'john@brdg.app',
				introsOffered: {free: 3, vip: 0}
			},
			{
				name: 'Billy Ray Jenkins',
				email: 'billy.jenkins@gmail.com',
				introsOffered: {free: 2, vip: 0}
			}
		]
	end

	def test_assign_vip_to_highest
		response = ContactOption.new.get_contact_options(@data)
		record = response.find { |item| item[:name] == 'John Doe' }
		assert_not_nil(record)
		assert_equal(1, record[:introsOffered][:vip])
		assert_equal(3, record[:introsOffered][:free])
  	end

	def test_calculate_rank
		response = ContactOption.new.get_contact_options(@data)
		record = response.find { |item| item[:name] == 'John Doe' }
		assert_not_nil(record)
		assert_equal(8, record[:rank])
  	end

	def test_assign_free_to_other_ranks
		response = ContactOption.new.get_contact_options(@data)
		record = response.find { |item| item[:name] == 'Billy Ray Jenkins' }
		assert_not_nil(record)
		assert_equal(3, record[:introsOffered][:free])
  	end
end