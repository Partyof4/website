class Views::Admin::Parties::Index < Views::Base
  needs :parties

  def content
    full_row {
      h1("Listing parties")

        table {
          thead {
            tr {
              th("Name")
              th("Email")
              th("Arrival Date")
              th("Join Date")
              th(:colspan => "2")
            }
          }
          tbody {
            parties.each do |p|
              tr {
                td { text "#{p.first_name} #{p.last_name}" }
                td { text p.email }
                td { text p.arrival }
                td { text p.created_at }
                td { link_to 'Show', admin_party_path(p) }
                td { link_to 'Destroy', admin_party_path(p), method: :delete, data: { confirm: 'Are you sure?' } }
              }
            end
          }
        }
        link_to "Download as CSV", url_for(:controller=>'admin', :action=>'index', :format=>:csv), class: "white-text"

      p {
        link_to 'Back', admin_path, class: "white-text"
      }
    }
  end
end
