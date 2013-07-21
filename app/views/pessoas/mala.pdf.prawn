pdf.font "Helvetica"
pdf.define_grid(:columns => 3, :rows => 10, :column_gutter => 10)

pdf.grid.rows.times do |i|
  pdf.grid.columns.times do |j|
    
    b = pdf.grid(i,j)
    pdf.bounding_box b.top_left, :width => b.width, :height => b.height do

  

        pdf.stroke do
            pdf.rectangle(pdf.bounds.top_left, b.width, b.height)
        end

    end
  end
  @pessoa.each do |p|
      pdf.text "#{p.aniversariante('pdf')}", :size => 10
    end
end
