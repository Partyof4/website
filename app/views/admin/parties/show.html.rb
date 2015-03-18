class Views::Admin::Parties::Show < Views::Base
  needs :party

  def content
    full_row {
      table {
        thead {
          party.attributes.keys.each do |field|
            th {
              text field
            }
          end
        }
        tbody {
            tr {
              party.attributes.each do |name, value|
                td {
                  text value
                }
              end
            }
        }
      }

      p {
        link_to 'Back', admin_parties_path, class: "white-text"
      }
    }
  end
end
