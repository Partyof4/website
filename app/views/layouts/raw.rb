class Views::Layouts::Raw < Views::Base
  def content
    doctype!
    html(:lang => "en") {
      head {
        meta(:content => "text/html; charset=UTF-8", "http-equiv" => "Content-Type")
        meta(:charset => "utf-8")
        meta(:content => "width=device-width, initial-scale=1.0", :name => "viewport")
        meta(:content => "Party of 4 helps you find new friends in your new home, in your new life.", :name => "description")

        title(content_for?(:title) ? yield(:title) : "Party of 4")

        stylesheet_link_tag 'application', media: 'all', 'data-turbolinks-track' => true
        stylesheet_link_tag '//fonts.googleapis.com/css?family=Lato|Slabo+27px'
        javascript_include_tag 'vendor/modernizr'
        javascript_include_tag 'application', 'data-turbolinks-track' => true
        favicon_link_tag 'po4.ico?v=2'
        csrf_meta_tags
      }

      body {
        div(class: "contain-to-grid") {
          nav(:class => "top-bar", "data-topbar" => "", :role => "navigation") {
            ul(:class => "title-area") {
              li(:class => "name") {
                h1 {
                  a(:href => "/") {
                    image_tag asset_url("po4_logo.png"), class: "logo", alt: "Partyof4 Logo"
                    text "party of 4"
                  }
                }
              }

              li(:class => "toggle-topbar menu-icon") {
                a(:href => "#") {
                  span
                }
              }
            }

            section(class: "top-bar-section") {
              ul(class: "right") {
                li(class: "active") {
                  a(href: profile_path) {
                    text "Create a profile"
                  }
                }
              }
            }

            yield :navigation
          }

          flash.each do |name, msg|
            div("aria-labelledby" => "flash-msg-#{name}", "aria-role" => "dialog", :class => "alert-box flash-msg #{name}", "data-alert" => "") {
              div(msg, :id => "flash-msg-#{name}")
              a("×", :class => "close", :href => "#")
            }
          end


          content_for?(:body) ? yield(:body) : yield

          if content_for?(:footer)
            footer(class: :'fat-footer') {
              yield :footer
            }
          end
        }
      }
    }
  end
end
