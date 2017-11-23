module Api
  module Users
    class UsersController < AuthenticatedController
      def show
        render json: User.find(params[:id])
      end

      def update
        user = User.find(params[:id])
        permitted_params = params.require(:user).permit(:password, :email)
        user.update_attributes!(permitted_params)

        render json: user
      end
    end
  end
end


