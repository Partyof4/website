class Views::LoggedOut::TakeActionButton < Views::Base
  def content
    div(class: buttonish(:large, :alert), onclick: "analytics.track('acquisition/no-abandon')") {
      a(href: profile_path) {
        text "Create a Profile"
      }
    }
  end
end