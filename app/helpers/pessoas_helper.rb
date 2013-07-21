module PessoasHelper
def pessoa_picture_column(record)
    image_tag record.picture.url(:medium)
  end


#  def pessoa_picture_form_column(record, options)
#    content_tag :div, :id => "div-input-file" do
#      result = []
#      result << file_field(:record, :picture, :size => "30", :id => "file-original", :onchange => "document.getElementById('file-falso').value = this.value;")
#      result << content_tag(:div, :id => "div-input-falso") do
#        tag :input, :name => "file-falso", :type => "text", :id => "file-falso"
#      end
#      result.join
#    end
#
#  end
end