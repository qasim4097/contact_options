

class ContactOption
	
	EMAILS = ["gmail.com", "outlook.com", "hotmail.com"]

    def get_contact_options(data)

        for item in data
            ranking = 3
            ranking += 2 unless EMAILS.any? { |s| item[:email].include?(s) }
            ranking += item[:introsOffered][:free] + item[:introsOffered][:vip] 
            item[:rank] = ranking
        end

        data.sort_by! {|obj| -obj[:rank]}

        data.each_with_index do |value, index|
			if index == 0 
				if value[:introsOffered][:vip] == 0
					value[:introsOffered][:vip] = 1
					value[:contactOption] = 'VIP'
				else
					value[:introsOffered][:free] += 1
					value[:contactOption] = 'free'
				end
			else
				value[:introsOffered][:free] += 1
				value[:contactOption] = 'free'
			end
		end
        data.sort_by! {|obj| [obj[:name].split.first, obj[:name].split.last]}
    end
end

data = [
	{
		name: 'John Doe',
		email: 'john@brdg.app',
		introsOffered: {free: 3, vip: 0}
	},
	{
		name: 'Billy Ray Jenkins',
		email: 'billy.jenkins@gmail.com',
		introsOffered: {free: 5, vip: 0}
	},
	{
		name: 'Jenny Baggins',
		email: 'jeni@x.com',
		introsOffered: {free: 5, vip: 1}
	},
	{
		name: 'Lloyd Banks',
		email: 'lloyd@banks.com',
		introsOffered: {free: 0, vip: 0}
	},
	{
		name: 'BA Lewis',
		email: 'ba.lewis@outlook.com',
		introsOffered: {free: 8, vip: 0}
	},
	{
		name: 'John Johnson',
		email: 'jj@z.com',
		introsOffered: {free: 4, vip: 0}
	},
	{
		name: 'Adam Johnson',
		email: 'aj@z.com',
		introsOffered: {free: 4, vip: 0}
	},
	{
		name: 'Joey Simpson',
		email: 'joey@hotmail.com',
		introsOffered: {free: 9, vip: 0}
	},
	{
		name: 'Penny Smith',
		email: 'penny@smith.com',
		introsOffered: {free: 2, vip: 0}
	}
]

# puts ContactOption.new.get_contact_options(data)



