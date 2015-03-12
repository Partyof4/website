class Views::LoggedOut::Index < Views::Base
  def content
    wide_row(:'background-cover') {
      div(class: %[clear-panel text-center]) {
        h1 {
          span "Bigger Circle.", class: :'text-primary'
          br
          span "Larger Life.", class: :'text-alert'
        }
        h4 "Recently Relocated? Let us make some introductions."

        p "We match people and their partners with others who are nearby & have similar interests."
        p "It's 2015. The Internet's not just for dating anymore..."

        render partial: "take_action_button"
      }
    }
    wide_row(:'palate-white-on-green') {
      blockquote(class: :'blockquote-grande') {
        text "\"When we first moved to Seattle making friends was tough. After we discovered party of 4 we've had several fun evenings with new people and made a couple of really great friends.\""
        cite "Jenn & Greg"
      }
    }
    wide_row(:'palate-green-on-white text-center') {
      h4 "About Party of 4"
      img(class: "medium-8 columns", src: asset_path('kevin_and_wendy.jpg'))
      p "2014 was a year of change for us. We were faced with an empty nest and a cross-country move. We loved the exhilaration that came with exploring a new city, but we missed the comfort of weekend plans with long-time friends. We needed to build a new circle, populated with other couples who liked to do the things we do. Meetups were fun but mostly full of single people. Striking up conversations at restaurants and cultural events proved hit-or-miss. Our apartment building was full of people our kids' ages."
      p "Surely there are others facing the same challenges, we thought. Wouldn't it be great if there was an easier way, we thought. Wait a minute, maybe there could be, we thought."
      p "We developed Party of 4 to meet those challenges. To help you find new friends in your new home, in your new life. Become your own party of 4. Or 6. Or 8. Bigger circle; larger life."
      render partial: "take_action_button"
    }
    javascript "analytics.track('acquisition/visit')"
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
