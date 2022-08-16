# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_08_08_184304) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "colaboracoes", force: :cascade do |t|
    t.integer "colaborador_id"
    t.integer "t_colaboracao_id"
    t.integer "engajamento_id"
    t.string "status", default: "criado"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contatos", force: :cascade do |t|
    t.integer "contatavel_id"
    t.string "contatavel_type"
    t.integer "t_contato_id"
    t.string "contato"
    t.boolean "principal", default: false
    t.string "observacao"
    t.string "status", default: "inativo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "documentos", force: :cascade do |t|
    t.integer "documentavel_id"
    t.string "documentavel_type"
    t.integer "t_documento_id"
    t.string "numero"
    t.string "emissor"
    t.date "emissao"
    t.integer "uf_id"
    t.string "zona_eleitoral"
    t.string "secao"
    t.string "serie"
    t.string "visto"
    t.string "livro"
    t.string "folha"
    t.string "observacao"
    t.boolean "verificacao", default: false
    t.date "verificacao_data"
    t.integer "verificacao_responsavel_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "enderecos", force: :cascade do |t|
    t.integer "enderecavel_id"
    t.string "enderecavel_type"
    t.string "logradouro"
    t.string "bairro"
    t.string "numero"
    t.string "cep"
    t.string "complemento"
    t.integer "municipio_id"
    t.string "observacao"
    t.boolean "verificacao", default: false
    t.date "verificacao_data"
    t.integer "verificacao_responsavel_id"
    t.boolean "principal", default: false
    t.string "status", default: "inativo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "engajados", force: :cascade do |t|
    t.integer "pessoa_id"
    t.integer "colaboracao_id"
    t.string "status", default: "inativo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "engajamentos", force: :cascade do |t|
    t.string "nome"
    t.text "descricao"
    t.integer "natureza_id", default: 1
    t.integer "responsavel_id"
    t.string "status", default: "criado"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "est_civis", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "estados", force: :cascade do |t|
    t.string "nome"
    t.string "sigla"
    t.boolean "verdadeiro", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "etnias", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "municipios", force: :cascade do |t|
    t.string "nome"
    t.integer "estado_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "nacoes", force: :cascade do |t|
    t.string "nome"
    t.string "codigo"
    t.string "alpha3"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "naturezas", force: :cascade do |t|
    t.string "nome"
    t.string "marcador"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "participantes", force: :cascade do |t|
    t.integer "participante_id"
    t.integer "colaboracao_id"
    t.integer "engajamento_id"
    t.string "status", default: "criado"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pessoas", force: :cascade do |t|
    t.string "nome"
    t.string "cpf"
    t.string "mae"
    t.date "nascimento"
    t.integer "sexo_id", default: 1
    t.integer "t_sanguinea_id", default: 1
    t.integer "etnia_id", default: 1
    t.integer "est_civil_id", default: 1
    t.integer "nacionalidade_id", default: 1
    t.integer "naturalidade_id", default: 1
    t.boolean "verificacao", default: false
    t.date "verificacao_data"
    t.integer "verificacao_responsavel_id"
    t.string "status", default: "inativo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cpf"], name: "index_pessoas_on_cpf", unique: true
  end

  create_table "predicativos", force: :cascade do |t|
    t.integer "t_predicante_id"
    t.integer "t_predicativo_id"
    t.integer "registro_responsavel_id"
    t.date "registro_data"
    t.string "status", default: "criado"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sexos", force: :cascade do |t|
    t.string "nome"
    t.string "descricao"
    t.text "observacoes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "t_colaboracoes", force: :cascade do |t|
    t.string "nome"
    t.integer "natureza_id"
    t.string "descricao"
    t.string "status", default: "criado"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "t_contatos", force: :cascade do |t|
    t.string "nome"
    t.string "classe"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "t_documentos", force: :cascade do |t|
    t.string "nome"
    t.string "descricao"
    t.integer "tipo"
    t.boolean "principal", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "t_predicativos", force: :cascade do |t|
    t.string "nome"
    t.integer "natureza_id"
    t.integer "valor"
    t.string "status", default: "criado"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "t_sanguineas", force: :cascade do |t|
    t.string "nome"
    t.string "grupo"
    t.string "fator_rh"
    t.string "verdadeiro", default: "f"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "usuarios", force: :cascade do |t|
    t.integer "pessoa_id"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_usuarios_on_email", unique: true
    t.index ["pessoa_id"], name: "index_usuarios_on_pessoa_id", unique: true
    t.index ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true
  end

end
