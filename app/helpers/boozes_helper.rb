module BoozesHelper
  def render_user_link (booze, user)
    if (booze.get_user_rating(user).to_s.eql?("Not Rated"))
      return link_to 'Add to My Boozes', booze_user_add_path (booze.id)
    end
    link_to 'Change My Rating',booze_user_rerate_path(booze.id)
  end
end
