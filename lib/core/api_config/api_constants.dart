//const kBaseUrl = 'http://192.168.1.3:3000/v1';
// const domain = 'https://wyca.herokuapp.com';
const domain = 'http://192.168.1.3:8000';

// const kBaseUrl = 'https://wyca.herokuapp.com/v1';
const kBaseUrl = '$domain/v1';

const kRegister = '$kBaseUrl/auth/register';
const kRegisterProvider = '$kBaseUrl/auth/provider/register';

const kLogin = '$kBaseUrl/auth/login';
const kLoginProvider = '$kBaseUrl/auth/provider/login';

const kGetMe = '$kBaseUrl/auth/get-me';
const kGetMeProvider = '$kBaseUrl/auth/provider/get-me';

const kUpdateMe = '$kBaseUrl/auth/update-me';
const kUpdateMeProvider = '$kBaseUrl/auth/provider/update-me';

const kUpdateCars = '$kBaseUrl/auth/update-me/cars';
const kUpdateAddresses = '$kBaseUrl/auth/update-me/addresses';

const kPackage = '$kBaseUrl/packages';

const kOrder = '$kBaseUrl/orders?byUser=true';
const kRequest = '$kBaseUrl/request';
const kNear = '$kBaseUrl/providers/near';
