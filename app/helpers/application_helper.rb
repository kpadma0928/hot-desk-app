module ApplicationHelper

  def change_locale_path(is_logged_in:, locale:, redirect_uri:)
    if is_logged_in
      paths.change_locale_path(locale: locale, redirect_uri: redirect_uri)
    else
      path_after_locale_change(locale: locale, redirect_uri: redirect_uri)
    end
  end

  # Path after the current_user locale has been changed OR
  # the new locale path, if anonymous user.
  def path_after_locale_change(locale:, redirect_uri:)
    "/#{locale}/#{redirect_uri}"
  end

  def paths
    @_url_helpers ||= Rails.application.routes.url_helpers
  end

  def locale_change_links
  	new_path = request.fullpath.clone
    new_path.slice!("/#{params[:locale]}")
    new_path.slice!(0,1) if new_path =~ /^\//
    @return_to = new_path
    locales = HotDesk::AVAILABLE_LOCALES.map { |loc| [loc[:name], loc[:ident]] }
    locales.map { |(title, locale_code)|
      {
        url: change_locale_path(is_logged_in: current_user.present?,
                                            locale: locale_code,
                                            redirect_uri: @return_to),
        title: title
      }
    }
  end
end
