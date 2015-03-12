class Views::Admin::Admin::Index < Views::Base
  needs :parties

  def content
    full_row {
      h1("Parties")
      table {
        thead {
          parties.first.attributes.keys.each do |field|
            th {
              text field
            }
          end
        }
        tbody {
          parties.each do |p|
            tr {
              p.attributes.each do |name, value|
                td {
                  text value
                }
              end
            }
          end
        }
      }
      link_to "Download as CSV", url_for(:controller=>'admin', :action=>'index', :format=>:csv), class: "white-text"
    }
  end
end
