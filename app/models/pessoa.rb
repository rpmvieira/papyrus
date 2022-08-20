class Pessoa < ApplicationRecord

	belongs_to :sexo
	belongs_to :etnia
	belongs_to :est_civil
	belongs_to :t_sanguinea
	belongs_to :naturalidade, class_name: "Municipio"
	has_one :usuario
	has_many :colaboracoes, :foreign_key => "colaborador_id",:dependent=>:destroy
	has_many :engajados,:dependent=>:destroy 
	has_many :documentos, as: :documentavel,:dependent=>:destroy
	accepts_nested_attributes_for :documentos, reject_if: lambda {|a| a['numero'].blank?}, allow_destroy: true
	has_many :enderecos, as: :enderecavel,:dependent=>:destroy 
	accepts_nested_attributes_for :enderecos, :reject_if => lambda { |a| a[:logradouro].blank? }, :allow_destroy => true
  has_many :contatos, as: :contatavel,:dependent=>:destroy #ver se isso funciona e colocar nos outros
  accepts_nested_attributes_for :contatos, :reject_if => lambda { |a| a[:contato].blank? }, :allow_destroy => true

  validate :designacao
  # validates :nome, presence: true, if: Proc.new { |a| a.apelido.blank?} 
  # validates :apelido, presence: true, if: Proc.new { |a| a.nome.blank? }
  # if: [Proc.new {|f| f.apelido.blank? }]
  # { "Celular deve ter 11 digitos. Padrão '(00) 00000-0000'" }
  # validates :apelido, presence: { "Contato fixo deve ter 10 digitos. Padrão '(00) 0000-0000'", :if => Proc.new {|f| f.nome.blank? } }  
  validates :mae, :nascimento, presence: { message:"Não pode ficar em branco!" }
  # validates :cpf, uniqueness: { message: "Já existe um registro com esta configuração" }

  enum nacionalidade_id: { 'Brasileira'=> 1, 'Naturalizado'=> 2, 'Estrangeiro'=>3 }




  def designacao
  	if nome.blank? && apelido.blank?
  		errors.add(:base, "A denominação de nome ou apelido devem ser preenchidos")
  	end
  end

  def retorna_principal(colecao)
  	begin
  		return colecao.find_by_principal(true)
  	rescue Exception => e
  		return nil
  	end
  end

  def endereco_principal
  	begin
  		return enderecos.find_by_principal(true)
  	rescue Exception => e
  		return nil
  	end
  end

end
