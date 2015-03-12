class Views::Parties::New < Views::Base
  needs :party

  def content
    wide_row(:'background-cover') {
      form_for(party) do |f|

        div(class: %[clear-panel form]) {
          h4 "Create a Profile"
          p "Answering a few quick questions will help us match you with like minded couples in your area!"
          div(class: "row") {
            div(class: "medium-6 columns") {
              f.label :first_name
              f.text_field :first_name, placeholder: "First Name"
            }
            div(class: "medium-6 columns") {
              f.label :last_name
              f.text_field :last_name, placeholder: "Last Name"
            }
          }
          div(class: "row") {
            div(class: "medium-12 columns") {
              f.label :email
              f.text_field :email, placeholder: "you@example.com"

            }
          }
          div(class: "row") {
            div(class: "medium-12 columns") {
              f.label "Where do you live?"
              f.text_field :location, placeholder: "Seattle"
            }
          }
          div(class: "row") {
            div(class: "medium-12 columns") {
              f.label "When did you arrive?"
              f.text_field :arrival, placeholder: "March of 2014"
            }
          }
          div(class: "row") {
            div(class: "medium-12 columns") {
              f.label "How old were you when you moved?"
              f.text_field :age, placeholder: "42"
            }
          }
          div(class: "row") {
            div(class: "medium-12 columns") {
              f.label "What did you do this past weeked?"
              f.text_area :weekends, placeholder: "Watched Netflix, Played Backgammon, Shopped for Wine..."
            }
          }
          div(class: "row") {
            div(class: "medium-12 columns") {
              f.label "Name 5 things you and/or your partner cannot live without"
              f.text_area :fives, placeholder: "Jazz, Craft Beer, Library Card, Seahawks ..."
            }
          }
          div(class: "row") {
            div(class: "medium-12 columns") {
              f.label "Any deal breakers?"
              f.text_area :dealbreakers, placeholder: "Politics, Mediterranean food, 49ers fans..."
            }
          }
          p "This information will be kept private and your email will not be shared."
        }
        div(class: "text-center") {
          br
          submit_tag("Create Your Profile", :class => buttonish(:large, :alert, :bordered), onclick: "analytics.track('activation/signup')")
        }
        p(class: "white-text") {
          text "After you create your profile you will be contacted by a concierge to setup your first event!"
        }
      end
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
