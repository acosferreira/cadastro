Ruport::Formatter::Template.create(:default) do |format|
  format.page = {
  :layout => :landscape
}
format.grouping = {
:style => :separated
}
format.text = {
:font_size => 16,
:justification => :center
}
format.table = {
:font_size => 10,
:heading_font_size => 10,
:maximum_width => 750,
:width => 750
}
format.column = {
:font_size => 8,
:alignment => :left,
:maximum_width => 200
}
format.heading = {
:alignment => :left
}
end