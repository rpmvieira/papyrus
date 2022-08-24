module ApplicationHelper

	def sub_masked(string=nil)
		if string.present?
			string.gsub(/(?<=.{2}).*.*(?=\S{2})/, '******')
		else
			"-"
		end
	end

	def string(string=nil)
		if string.present?
			string
		else
			"-"
		end
	end

	def abre_modal
		return "<div class='fixed z-10 inset-0 overflow-y-auto' aria-labelledby='modal-title' role='dialog' aria-modal='true'>
		<div class='flex items-end justify-center min-h-screen pt-4 px-4 pb-20 text-center sm:block sm:p-0'>
		<div class='fixed inset-0 bg-gray-500 bg-opacity-75 transition-opacity' aria-hidden='true'></div>
		<span class='hidden sm:inline-block sm:align-middle sm:h-screen' aria-hidden='true'>&#8203;</span>
		<div class='inline-block align-bottom bg-white rounded-lg px-4 pt-5 pb-4 text-left overflow-hidden shadow-xl transform transition-all sm:my-8 sm:align-middle sm:max-w-lg sm:w-full sm:p-6'>".html_safe
	end

	def fecha_modal
		return "</div></div></div>".html_safe
	end

	def form_label(string)
		return "<label for='mensagem_conteudo' class='peer-focus:font-medium absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:left-0 peer-focus:text-blue-600 peer-focus:dark:text-blue-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6'>#{string}</label>".html_safe
	end

	def br(string)
		return "Liderança" if string == "lideranca"
		return "Colaborador" if string == "colaborador"
		return string 
	end

	def classe_menu
		return "inline-block p-4 rounded-t-lg border-b-2 border-transparent hover:text-gray-600 hover:border-gray-300 dark:hover:text-gray-300 dark:border-transparent text-gray-500 dark:text-gray-400 border-gray-100 dark:border-gray-700".html_safe
	end

end
