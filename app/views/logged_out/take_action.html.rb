class Views::LoggedOut::TakeAction < Views::Base
  def content
    wide_row(:'background-cover') {
      form {

        div(class: %[clear-panel form]) {
          h4 "Create a Profile"
          p "Answering a few quick questions will help us match you with like minded couples in your area!"
          div(class: "row") {
            div(class: "medium-6 columns") {
              label {
                text "First Name"
                input(type: "text", placeholder: "First Name")
              }
            }
            div(class: "medium-6 columns") {
              label {
                text "Last Name"
                input(type: "text", placeholder: "Last Name")
              }
            }
          }
          div(class: "row") {
            div(class: "medium-12 columns") {
              label {
                text "Email"
                input(type: "text", placeholder: "you@example.com")
              }
            }
          }
          div(class: "row") {
            div(class: "medium-12 columns") {
              label {
                text "Where do you live?"
                input(type: "text", placeholder: "Seattle")
              }
            }
          }
          div(class: "row") {
            div(class: "medium-12 columns") {
              label {
                text "When did you arrive?"
                input(type: "text", placeholder: "March of 2014")
              }
            }
          }
          div(class: "row") {
            div(class: "medium-12 columns") {
              label {
                text "How old were you when you moved?"
                input(type: "text", placeholder: "42")
              }
            }
          }
          div(class: "row") {
            div(class: "medium-12 columns") {
              label {
                text "What did you do this past weeked?"
                textarea(placeholder: "Watched Netflix, Played Backgammon, Shopped for Wine...")
              }
            }
          }
          div(class: "row") {
            div(class: "medium-12 columns") {
              label {
                text "Name 5 things you and/or your partner cannot live without"
                textarea(placeholder: "Jazz, Craft Beer, Library Card, Seahawks ...")
              }
            }
          }
          div(class: "row") {
            div(class: "medium-12 columns") {
              label {
                text "Any deal breakers?"
                textarea(placeholder: "Politics, Mediterranean food, 49ers fans...")
              }
            }
          }
          p "This information will be kept private and your email will not be shared."
        }
        div(class: "text-center") {
          br
          render partial: "activation_button"
        }
        p(class: "white-text") {
          text "After you create your profile you will be contacted by a concierge to setup your first event!"
        }
      }
    }

  end

  private

  def wide_row(add_class)
    classes = [:fullWidth]
    classes << add_class
    row(class: classes) {
      column {
        row {
          column(:'medium-8', class: :'medium-offset-2') {
            br
            yield
          }
        }
      }
    }
  end
end
