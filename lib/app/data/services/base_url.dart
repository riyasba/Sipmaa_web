abstract class BaseApiService {
  final String baseUrl = "https://demo.generation360tech.in/api/";

  //register url
  final String registerURl =
      'https://demo.generation360tech.in/api/register_user';

  //"https://demo.generation360tech.in/api/register_user";
  //'https://admin.e-sankalp.com/public/api/planet';

  //login url
  final String loginURL = "https://demo.generation360tech.in/api/login";

  //otp Verify url
  final String otpVerifyURL =
      "https://demo.generation360tech.in/api/auth/otp_verrify";

//get departments url
  final String departmentsURL =
      "https://demo.generation360tech.in/api/department";

//update Profile URL
  final String updateProfileURL =
      "https://demo.generation360tech.in/api/auth/profile_update";

//get all posts
  final String getAllPostsURL =
      "https://demo.generation360tech.in/api/auth/get_post";

  //upload  a post
  final String uploadPostURL =
      "https://demo.generation360tech.in/api/auth/create_post";

  //Search posts
  final String searchPostURL =
      "https://demo.generation360tech.in/api/auth/post_search";

  //Search friends
  final String searchFriendsURL =
      "https://demo.generation360tech.in/api/auth/friends_search";

  //get profile details
  final String getProfileDetailsURL =
      "https://demo.generation360tech.in/api/auth/profile";

  //add friends
  final String addFriendsURL =
      "https://demo.generation360tech.in/api/auth/add_request";

//add friends
  final String friendListURL =
      "https://demo.generation360tech.in/api/auth/friends_list";

//friends request list
  final String frindRequestList =
      "https://demo.generation360tech.in/api/auth/friends_list_recive";

//like a post
  final String postLikeURL =
      "https://demo.generation360tech.in/api/auth/post_like";
 
//send friend request
  final String sendFriendRequestURL =
      "https://demo.generation360tech.in/api/auth/add_request";

//update friend request
  final String updateFriendRequestURL =
      "https://demo.generation360tech.in/api/auth/respond_request";

//post_comments
  final String postCommemtsURL =
      "https://demo.generation360tech.in/api/auth/post_comment";

  //post_comments_list
  final String postCommentsListURL =
      "https://demo.generation360tech.in/api/auth/post_comments_list";

//post filter api services
  final String filerURL =
      "https://demo.generation360tech.in/api/auth/filter_post";

//change password api services
  final String changePasswordURL =
      "https://demo.generation360tech.in/api/auth/change_password_new";

//post_like_list
  final String postLikeListURL =
      "https://demo.generation360tech.in/api/auth/post_like_list";

//user_name check
  final String userNameCheckURL =
      "https://demo.generation360tech.in/api/user_check";

//slider Api URL
  final String sliderURL = "https://demo.generation360tech.in/api/get_slider";
}
