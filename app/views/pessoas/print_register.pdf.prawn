pdf.font "Helvetica"

pdf.text "IURD - Praça Seca - Ficha Cadastral de #{@pessoa.tipo.name}", :size => 18, :style => :bold, :spacing => 4, :align=>:center

img_file = "#{@pessoa.picture.path(:medium)}" || "public/images/no-picture-thumb.jpg"
pdf.image img_file

pdf.text "#{@pessoa.ficha(@pessoa.id, 'pdf')}", :size => 10

