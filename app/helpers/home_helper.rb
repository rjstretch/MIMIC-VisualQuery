module HomeHelper
	def tp_pre data, options={}
		content_tag :pre, TablePrint::Printer.new(data, options).table_print
	end
end
