module ApplicationHelper
	def select_year(date, options = {}, html_options = {})
	 select_year(Date.today, :start_year => 1898, :end_year => 2019)
	     end
end
