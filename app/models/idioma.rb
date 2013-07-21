class Idioma < ActiveRecord::Base
  has_and_belongs_to_many :pessoa

end