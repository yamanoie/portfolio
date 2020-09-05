module EnsureCorrectObjects
	extend ActiveSupport::Concern

	def ensure_correct_user
		if current_user.id != params[:id].to_i
			redirect_to "/"
		end
	end

	def ensure_correct_post
		post = Post.find(params[:id])
		if current_user.id != post.user.id
			redirect_to "/"
		end
	end

	def ensure_correct_match
		match = Match.find(params[:id])
		if current_user.id != match.user.id
			redirect_to "/"
		end
	end

	def ensure_correct_room
		room = Room.find_by(id:params[:id])
		if current_user.id != room.user_id && current_user.id != room.guest_id
			redirect_to "/"
		end
	end


end