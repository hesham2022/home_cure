//const kBaseUrl = 'http://192.168.1.3:3000/v1';
// const domain = 'https://wyca.herokuapp.com';
const domain = 'http://192.168.1.4:8000';

// const kBaseUrl = 'https://wyca.herokuapp.com/v1';
const kBaseUrl = '$domain/v1';

const kRegister = '$kBaseUrl/auth/register';
const kRegisterProvider = '$kBaseUrl/auth/provider/register';
const kForgotPassword = '$kBaseUrl/auth/forgot-password';
const kSendOtp = '$kBaseUrl/auth/send-verification-otp';

const kverifyForgotPassword = '$kBaseUrl/auth/verify-forget-password-otp';
const kVerifyOtp = '$kBaseUrl/auth/verify-otp';

const kResetPassword = '$kBaseUrl/auth/reset-password';
const kLogin = '$kBaseUrl/auth/login';
const kProviderLogin = '$kBaseUrl/provider-auth/login';
const kUpadetProvider = '$kBaseUrl/providers/update-me';

const kUploadProviderPhoto = '$kBaseUrl/providers/update-me/upload-photo';
const kUploadProviderAttachment = '$kBaseUrl/providers/update-me/attachments';

const kLoginProvider = '$kBaseUrl/auth/provider/login';
const kPhotosUrl = '$domain/img/attachments/';

const kGetMe = '$kBaseUrl/auth/me';
const kUsers = '$kBaseUrl/users/';
const kgetSevices = '$kBaseUrl/service';
const kTimeslot = '$kBaseUrl/timeslot';
const kAds = '$kBaseUrl/ad';

const kApppointment = '$kBaseUrl/appointment';
const kAcceptAppointments = '$kApppointment/provider/accept/';
const kOnProccessingAppointments = '$kApppointment/provider/OnProcessing/';
const kDoneAppointments = '$kApppointment/provider/done/';

const kUserPay = '$kApppointment/pay/';
const kPorividerPay = '$kApppointment/provider/pay/';

const kStartVideo = '$kApppointment/video/';

const kCreatePaymentLink = '$kApppointment/get_payment_link/';

const kGetMeProvider = '$kBaseUrl/auth/provider/get-me';

const kUpdateMe = '$kBaseUrl/users/update-me';
const kUUploadAttachment = '$kBaseUrl/users/update-me/attachments';
const kUUploadUserPhoto = '$kBaseUrl/users/update-me/upload-photo';

const kUpdateMeProvider = '$kBaseUrl/auth/provider/update-me';

const kUpdateCars = '$kBaseUrl/auth/update-me/cars';
const kUpdateAddresses = '$kBaseUrl/auth/update-me/addresses';

const kPackage = '$kBaseUrl/packages';

const kOrder = '$kBaseUrl/orders?byUser=true';
const kRequest = '$kBaseUrl/request';
const kNear = '$kBaseUrl/providers/near';
