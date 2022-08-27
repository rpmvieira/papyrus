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
		return "<div data-controller='modal' >
		<div id='medium-modal' tabindex='-1' class='fixed z-20 inset-0 overflow-y-auto' aria-labelledby='modal-title' role='dialog' aria-modal='true'>
		<div class='flex items-end justify-center min-h-screen pt-4 px-4 pb-20 text-center sm:block sm:p-0'  role='dialog'>
		<div class='fixed inset-0 bg-gray-500 bg-opacity-75 transition-opacity' aria-hidden='true'></div>
		<span class='hidden sm:inline-block sm:align-middle sm:h-screen' aria-hidden='true'>&#8203;</span>
		<div class='inline-block align-bottom bg-white rounded-lg px-4 pt-5 pb-4 text-left overflow-hidden shadow-xl transform transition-all sm:my-8 sm:align-middle sm:max-w-lg sm:w-full sm:p-6'>".html_safe
	end

	def fecha_modal
		return "</div></div></div></div>".html_safe
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

	def botao_desabilitado(helper_svg)
		return "<button type='button' class='text-gray-500 bg-gray-100 rounded-r-lg border border-gray-200 dark:bg-gray-500 cursor-not-allowed font-medium text-sm px-1 py-1 text-center' disabled='>#{helper_svg}</button>"
	end

	def botao_modal_hide
		return "<button data-action='modal#hideModal' class='cursor-pointer inline-flex items-center text-gray-700 hover:text-black border border-gray-700 hover:bg-gray-300 focus:ring-4 focus:outline-none focus:ring-gray-300 font-medium rounded-lg text-xs px-4 py-1.5 text-center mr-2 mb-2 dark:border-gray-500 dark:text-gray-500 dark:hover:text-white dark:hover:bg-gray-600 dark:focus:ring-gray-800'>Cancelar</button>".html_safe
	end

	def carregando
		return "<div class='grid grid-cols-1 p-8 gap-8 place-items-center'>
  <div id='toast-interactive' class='p-4 w-full max-w-xs text-gray-500 bg-white rounded-lg shadow dark:bg-gray-800 dark:text-gray-400' role='alert'>
    <div class='flex'>
      <div class='inline-flex flex-shrink-0 ml-3 justify-center items-center w-8 h-8 text-green-500 rounded-lg dark:text-yellow-300 dark:bg-yellow-900'>
        <svg role='status' class='inline mr-1 w-10 h-10 text-gray-200 animate-spin dark:text-gray-600' viewBox='0 0 100 101' fill='none' xmlns='http://www.w3.org/2000/svg'><path d='M100 50.5908C100 78.2051 77.6142 100.591 50 100.591C22.3858 100.591 0 78.2051 0 50.5908C0 22.9766 22.3858 0.59082 50 0.59082C77.6142 0.59082 100 22.9766 100 50.5908ZM9.08144 50.5908C9.08144 73.1895 27.4013 91.5094 50 91.5094C72.5987 91.5094 90.9186 73.1895 90.9186 50.5908C90.9186 27.9921 72.5987 9.67226 50 9.67226C27.4013 9.67226 9.08144 27.9921 9.08144 50.5908Z' fill='currentColor'/>
          <path d='M93.9676 39.0409C96.393 38.4038 97.8624 35.9116 97.0079 33.5539C95.2932 28.8227 92.871 24.3692 89.8167 20.348C85.8452 15.1192 80.8826 10.7238 75.2124 7.41289C69.5422 4.10194 63.2754 1.94025 56.7698 1.05124C51.7666 0.367541 46.6976 0.446843 41.7345 1.27873C39.2613 1.69328 37.813 4.19778 38.4501 6.62326C39.0873 9.04874 41.5694 10.4717 44.0505 10.1071C47.8511 9.54855 51.7191 9.52689 55.5402 10.0491C60.8642 10.7766 65.9928 12.5457 70.6331 15.2552C75.2735 17.9648 79.3347 21.5619 82.5849 25.841C84.9175 28.9121 86.7997 32.2913 88.1811 35.8758C89.083 38.2158 91.5421 39.6781 93.9676 39.0409Z' fill='#1C64F2'/></svg>
        <span class='sr-only'>Warning icon</span>
      </div>
      <div class='ml-2 text-sm font-normal'>
        <span class='mb-1 mt-3 text-lg font-semibold text-green-700 dark:text-white'>Carregando...</span>
        <div class='mb-2 text-xs font-normal'></div> 
      </div>
    </div>
  </div>
</div>".html_safe
	end

end
