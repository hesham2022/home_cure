// remote server
const domain = 'https://homecure.online/api';
// loclal server
// const domain = 'http://192.168.8.100:3000';

const kBaseUrl = '$domain/v1';

const kRegister = '$kBaseUrl/auth/register';
const kRegisterProvider = '$kBaseUrl/auth/provider/register';
const kForgotPassword = '$kBaseUrl/auth/forgot-password';
const kForgotPasswordFirebase = '$kBaseUrl/auth/forgot-password-firebase';

const kChangePhoneNumber = '$kBaseUrl/auth/change-phoneNumber';

const kSendOtp = '$kBaseUrl/auth/send-verification-otp';

const kverifyForgotPassword = '$kBaseUrl/auth/verify-forget-password-otp';
const kverifyChangePhoneNumber = '$kBaseUrl/auth/verify-change-phoneNumber-otp';

const kVerifyOtp = '$kBaseUrl/auth/verify-otp';
const kVerifyOtpFirebase = '$kBaseUrl/auth/verify-otp-firebase';

const kResetPassword = '$kBaseUrl/auth/reset-password';
const kResetPasswordFirebase = '$kBaseUrl/auth/reset-password-firebase';

const kResetPhoneNumber = '$kBaseUrl/auth/reset-phoneNumber';
const kResetPhoneNumberFirebase = '$kBaseUrl/auth/reset-phoneNumber-firebase';

const kLogin = '$kBaseUrl/auth/login';
const kProviderLogin = '$kBaseUrl/provider-auth/login';
const kUpadetProvider = '$kBaseUrl/providers/update-me';

const kUploadProviderPhoto = '$kBaseUrl/providers/update-me/upload-photo';
const kUploadProviderAttachment = '$kBaseUrl/providers/update-me/attachments';
const kDeleteProviderAttachment =
    '$kBaseUrl/providers/update-me/attachments/delete';
const kDeleteUserAttachment = '$kBaseUrl/users/update-me/attachments/delete';
const kLoginProvider = '$kBaseUrl/auth/provider/login';
const kPhotosUrl = '$domain/img/attachments/';

const kGetMe = '$kBaseUrl/auth/me';
const kUsers = '$kBaseUrl/users/';
const kProviders = '$kBaseUrl/providers/';

const kgetSevices = '$kBaseUrl/service';
const kTimeslot = '$kBaseUrl/timeslot';
const kAds = '$kBaseUrl/ad';

const kApppointment = '$kBaseUrl/appointment';
const kSetting = '$kBaseUrl/settings';
const kComplainment = '$kBaseUrl/compainments';

const kAcceptAppointments = '$kApppointment/provider/accept/';

const kCheckTimeSlot = '$kApppointment/check-timeslot';

const kOnProccessingAppointments = '$kApppointment/provider/OnProcessing/';
const kDoneAppointments = '$kApppointment/provider/done/';
const kRate = '$kApppointment/rate';

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
