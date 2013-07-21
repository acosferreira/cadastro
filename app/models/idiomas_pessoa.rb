class IdiomasPessoa < ActiveRecord::Base
  belongs_to :pessoa
  belongs_to :idioma
end