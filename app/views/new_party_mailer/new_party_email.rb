class Views::NewPartyMailer::NewPartyEmail < Views::EmailBase
  needs :party
  needs :url

  def content
    full_row {
      td {
        h6 {
          text "Hi!"
        }

        p {
          text "We received a new Partyof4.com signup. To view it, please "
          link_to "follow this link", url
          text "."
        }

        p {
          text "Here are the details:"
        }

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

        p "Sincerely,"

        p "Partyof4 Bot"
      }
    }
  end
end
