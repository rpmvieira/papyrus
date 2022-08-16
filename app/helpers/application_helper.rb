module ApplicationHelper

	def sub_masked(string)
		string.gsub(/(?<=.{2}).*.*(?=\S{2})/, '******')
	end


end
