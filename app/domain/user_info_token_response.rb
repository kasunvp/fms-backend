module UserInfoTokenResponse
  def body
    super.merge(user: user.attributes)
  end

  private

  def user
    User.find(@token.resource_owner_id)
  end
end
