# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110616011334) do

  create_table "ckeditor_assets", :force => true do |t|
    t.string   "data_file_name",                                 :null => false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    :limit => 30
    t.string   "type",              :limit => 25
    t.string   "guid",              :limit => 10
    t.integer  "locale",            :limit => 1,  :default => 0
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], :name => "fk_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_assetable_type"
  add_index "ckeditor_assets", ["user_id"], :name => "fk_user"

  create_table "conjuges", :force => true do |t|
    t.string  "name"
    t.date    "dt_nascimento"
    t.integer "pessoa_id"
    t.integer "tipo_id"
    t.date    "dt_casamento"
  end

  create_table "create_newsletters", :force => true do |t|
    t.string   "title"
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "tipo_id"
  end

  create_table "escolaridades", :force => true do |t|
    t.string "name"
  end

  create_table "estadocivils", :force => true do |t|
    t.string "name"
  end

  create_table "filhos", :force => true do |t|
    t.string  "name"
    t.date    "dt_nascimento"
    t.integer "pessoa_id"
  end

  create_table "idiomas", :force => true do |t|
    t.string "name"
  end

  create_table "idiomas_pessoas", :id => false, :force => true do |t|
    t.integer "pessoa_id"
    t.integer "idioma_id"
  end

  create_table "pessoas", :force => true do |t|
    t.string   "name"
    t.string   "endereco"
    t.string   "numero"
    t.string   "complemento"
    t.string   "bairro"
    t.string   "cidade"
    t.string   "uf"
    t.string   "cep"
    t.string   "telefone"
    t.date     "dt_nascimento"
    t.string   "nacionalidade"
    t.string   "naturalidade"
    t.integer  "rg"
    t.date     "rg_expedicao"
    t.integer  "cpf"
    t.string   "passaporte"
    t.date     "passaporte_expedicao"
    t.date     "passaporte_validade"
    t.integer  "titulo_eleitor"
    t.integer  "zona"
    t.integer  "secao"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.integer  "tipo_id"
    t.integer  "escolaridade_id"
    t.string   "email"
    t.integer  "estadocivil_id"
    t.string   "idioma"
    t.string   "profissao"
    t.date     "dt_conversao"
    t.string   "pr_levantou"
    t.string   "pr_responsavel"
    t.date     "dt_batismo_aguas"
    t.date     "dt_batismo_es"
    t.text     "testemunho"
  end

  create_table "pessoas_reuniaos", :id => false, :force => true do |t|
    t.integer "pessoa_id"
    t.integer "reuniao_id"
  end

  create_table "reuniaos", :force => true do |t|
    t.string "name"
    t.time   "horario"
  end

  create_table "tipos", :force => true do |t|
    t.string "name"
  end

  create_table "usuario_sessions", :force => true do |t|
    t.string   "login"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "usuarios", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
