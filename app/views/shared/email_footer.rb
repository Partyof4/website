class Views::Shared::EmailFooter < Views::EmailBase
  def content
    full_row(class: :footer) {
      td(class: :"text-pad") {
        p "Disclosures"
        p "..."
      }
    }

    full_row {
      center_td {
        div raw("&copy; #{Time.now.year} Partyof4, LLC. All Rights Reserved.")
      }
    }
  end
end
