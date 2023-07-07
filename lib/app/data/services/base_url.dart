abstract class BaseApiService {
  final String baseUrl = "https://sipmaaindia.com/api/";

  //register url
  final String registerURl = 'https://sipmaaindia.com/api/register_user';

  //"https://sipmaaindia.com/api/register_user";
  //'https://admin.e-sankalp.com/public/api/planet';

  //login url
  final String loginURL = "https://sipmaaindia.com/api/login";

  //otp Verify url
  final String otpVerifyURL = "https://sipmaaindia.com/api/auth/otp_verrify";

//get departments url
  final String departmentsURL = "https://sipmaaindia.com/api/department";

//update Profile URL
  final String updateProfileURL =
      "https://sipmaaindia.com/api/auth/profile_update";

//get all posts
  final String getAllPostsURL = "https://sipmaaindia.com/api/auth/get_post";

  //upload  a post
  final String uploadPostURL = "https://sipmaaindia.com/api/auth/create_post";

  //Search posts
  final String searchPostURL = "https://sipmaaindia.com/api/auth/post_search";

  //Search friends
  final String searchFriendsURL =
      "https://sipmaaindia.com/api/auth/friends_search";

  //get profile details
  final String getProfileDetailsURL =
      "https://sipmaaindia.com/api/auth/profile";

  //add friends
  final String addFriendsURL = 
  "https://sipmaaindia.com/api/auth/add_request";

//add friends
  final String friendListURL = 
  "https://sipmaaindia.com/api/auth/friends_list";

//friends request list
  final String frindRequestList =
      "https://sipmaaindia.com/api/auth/friends_list_recive";

//like a post
  final String postLikeURL = 
  "https://sipmaaindia.com/api/auth/post_like";

//send friend request
  final String sendFriendRequestURL =
      "https://sipmaaindia.com/api/auth/add_request";

//update friend request
  final String updateFriendRequestURL =
      "https://sipmaaindia.com/api/auth/respond_request";

//post_comments
  final String postCommemtsURL =
      "https://sipmaaindia.com/api/auth/post_comment";

  //post_comments_list
  final String postCommentsListURL =
      "https://sipmaaindia.com/api/auth/post_comments_list";

//post filter api services
  final String filerURL 
  = "https://sipmaaindia.com/api/auth/filter_post";

//change password api services
  final String changePasswordURL =
      "https://sipmaaindia.com/api/auth/change_password_new";

//post_like_list
  final String postLikeListURL =
      "https://sipmaaindia.com/api/auth/post_like_list";

//user_name check
  final String userNameCheckURL = "https://sipmaaindia.com/api/user_check";

//slider Api URL
  final String sliderURL = 
  "https://sipmaaindia.com/api/get_slider";

  final String getFcmToken = 
  "https://sipmaaindia.com/api/get_fcm";

  String fcmTokenStoreApiUrl =
      "https://sipmaaindia.com/api/auth/fcm-token";

  String getNotificationListURL =
      "https://sipmaaindia.com/api/auth/get_notifications";

  String deletePostURL =
      "https://sipmaaindia.com/api/auth/delete_post";

 //forget password
  String forgotPassword = "https://sipmaaindia.com/api/forgotPassword";

  //verify-otp
  String verifyOtp = "https://sipmaaindia.com/api/verifyOTP";

  //reset password
  String resetPassword = "https://sipmaaindia.com/api/resetpassword";

  //resend otp
  String resendOtp = "https://sipmaaindia.com/api/resendOTP";
}
//  final String updateProfileURL =
//       "https://sipmaaindia.com/api/auth/profile_update";