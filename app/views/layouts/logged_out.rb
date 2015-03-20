class Views::Layouts::LoggedOut < Views::Base
  def content
    content_for :footer do
      div(class: "footer text-center") {
        row {
          div(class: "medium-6 columns") {
            text "© #{Time.now.year} Partyof4, LLC. All rights reserved."
          }
          div(class: "medium-3 columns") {
            a(href: "https://www.facebook.com/pages/Party-of-4/1562411020694565") {
              text "Facebook"
            }
          }
          div(class: "medium-3 columns") {
            a(href: "mailto:info@partyof4.com") {
              text "info@partyof4.com"
            }
          }
        }
      }
    end
    render template: 'layouts/raw'
  end
end
