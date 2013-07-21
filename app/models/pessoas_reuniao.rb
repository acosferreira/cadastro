class PessoasReuniao < ActiveRecord::Base
  belongs_to :pessoa
  belongs_to :reuniao
end