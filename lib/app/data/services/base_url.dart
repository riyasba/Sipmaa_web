abstract class BaseApiService {
  final String baseUrl = "https://sipmaa.batechnology.in.net/api/";

  //register url
  final String registerURl =
      "https://sipmaa.batechnology.in.net/api/register_user";

  //login url
  final String loginURL = "https://sipmaa.batechnology.in.net/api/login";

  //otp Verify url
  final String otpVerifyURL =
      "https://sipmaa.batechnology.in.net/api/auth/otp_verrify";

//get departments url
  final String departmentsURL =
      "https://sipmaa.batechnology.in.net/api/department";

//update Profile URL
  final String updateProfileURL =
      "https://sipmaa.batechnology.in.net/api/auth/profile_update";

//get all posts
  final String getAllPostsURL =
      "https://sipmaa.batechnology.in.net/api/auth/get_post";

  //upload  a post
  final String uploadPostURL =
      "https://sipmaa.batechnology.in.net/api/auth/create_post";

  //Search posts
  final String searchPostURL =
      "https://sipmaa.batechnology.in.net/api/auth/post_search";

  //Search friends
  final String searchFriendsURL =
      "https://sipmaa.batechnology.in.net/api/auth/friends_search";

  //get profile details
  final String getProfileDetailsURL =
      "https://sipmaa.batechnology.in.net/api/auth/profile";

  //add friends
  final String addFriendsURL =
      "https://sipmaa.batechnology.in.net/api/auth/add_request";

//add friends
  final String friendListURL =
      "https://sipmaa.batechnology.in.net/api/auth/friends_list";

//friends request list
  final String frindRequestList =
      "https://sipmaa.batechnology.in.net/api/auth/friends_list_recive";

//like a post
  final String postLikeURL =
      "https://sipmaa.batechnology.in.net/api/auth/post_like";

//send friend request
  final String sendFriendRequestURL =
      "https://sipmaa.batechnology.in.net/api/auth/add_request";

//update friend request
  final String updateFriendRequestURL =
      "https://sipmaa.batechnology.in.net/api/auth/respond_request";

//post_comments
  final String postCommemtsURL =
      "https://sipmaa.batechnology.in.net/api/auth/post_comment";

  //post_comments_list
  final String postCommentsListURL =
      "https://sipmaa.batechnology.in.net/api/auth/post_comments_list";

//post filter api services
  final String filerURL =
      "https://sipmaa.batechnology.in.net/api/auth/filter_post";

//change password api services
  final String changePasswordURL =
      "https://sipmaa.batechnology.in.net/api/auth/change_password_new";

//post_like_list
  final String postLikeListURL =
      "https://sipmaa.batechnology.in.net/api/auth/post_like_list";

//user_name check
  final String userNameCheckURL =
      "https://sipmaa.batechnology.in.net/api/user_check";

//slider Api URL
  final String sliderURL = "https://sipmaa.batechnology.in.net/api/get_slider";
}
