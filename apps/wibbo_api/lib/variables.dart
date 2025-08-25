const apiKey = 'AIzaSyCfqrWnHn5O7hXdKgqB8_C6h9K7KyIOX0o';
const emailAdmin = 'zibmarket+admin@zibmarket.com';
const passwordAdmin = 'Zibmarket123+';

const jsonNotificationService = {
  'type': 'service_account',
  'project_id': 'zed-world',
  'private_key_id': '4b8adaf5f4ea52ec51ba7e78fd5c58a4bf6b8a9b',
  'private_key':
      '-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQDiEsMFfUt2l/dw\n4nKVLl5cpJhooCYqPkqDD6sZ90qtXktkRZakHncYawthoNB9D4OpKhGKVjVu0P2/\nZvVlqKq3VCDEct9CQo2wcfnuuad/7Z2QXh4lwIL94wPlL1uzKMI6G+jB0OQqsNr/\nK70xbjUk4HGXy/zgbtkgg7qCPng3e2hJTVtqUCAWfjBzTsfrNxCssk+oKQ4S/zGG\nWpKbHvbnOw0W9mJFao3Pl5Kch6h6mTXVL0blO5GM6dyDPcyFUpNmW7d9vCuYcryi\nKEp0JK846qLp8/F7cmr/uZ/ueVxSDI0yVc3bKOQAYZst37MNCdqxeLRswNweLrUE\nCx9e6O01AgMBAAECggEAAeKU4xx4RFAVlWw/TGc1KUc19yEm9MLw7khzeBjueuU2\nh6q14XCftDcPLVHA4YUxEdTJxrXGe5A2D6zgvq7YZAUCNCklm31c21980PMHv3Dc\n3rtxu4V3V31XeJy7glIg/ZcbmPF3cLPNGedvNrvGjLlrYtcezFLYTJdbtxRd4foX\nonzrVcAAv2wShS8CGQ6EKmXLCt5bupu2Pv76kgQfOqHzSsVL+CEKFwA4EokTh7dC\nl7FafcmIuCBNbHQvjnIalg6WijWoLeBNfcoueZZ1bk4e5YF+prp/MKx4Zcg/NG4k\niDuHdqFMpyQ9/uYpYOWhiRsWTeO5Q7XQi1QLtZkRgQKBgQD6YQ2e9tHSCAi2PoW7\net9pkfIyfdbtkIqro7nSQfK6AdRVPebi61xXbacLFYf/vMqi+mNh9JNzVrPKbAW/\nQLGadRf7voWIPswYVSsE5PhV9kuahkSyVGc5h4P785FOhqIssLgSCl0LUaAHeTj1\nzkfEXQe+2PDnjsQQ3KhnlEhPgQKBgQDnJgVxoGX1hticCVyIkCuQw0xKFnHbxA3e\nVvX0Ljf6SBjYlqq35qQsSrXSD/QPYRx3eMvwK1G/0foO+krZtwo7ECCXtI4Lec0K\nGGOLi74v3DMdVSyaYm38NN8V1y8OvVeUARLLtSoHw7DX5DROHWA/9r50Dy+riZ1m\n40y8GLQ3tQKBgEby95QjJuPYaPeTkfvFXseglrweEqhw/AqVM5PUIj75Q7z/9Iw6\n24jexqYKbOZYDifOwhjA4IOffwUORTaj03AMXEZ2/4nTGayPfcg+Rey+BUB9abwK\n1NFliE3+AB/7YLs/PHnIPAN4FtvnSu/Ei2umXQqEmQdU2lRY4tOvHiqBAoGAe87a\ntZzjX9qFZTaCcMc//n8M+tYA0GS3xPKxNMQYyZ8aZ9BzyqLoJq0xrD1NTXuHgtqZ\n6Z9aXzM6DBG2S90FxtMBkiBswOrRj2m20ATersX0Pu7jQCIepSswnoMuumdiZG0a\nwy/bPmNr8odSGNEVP82K/6EuuGOygmyXKlzVEs0CgYAYpzzhHJaTVkBzVe+QCByY\nZIuXOOxOQpDeRu3jGlsntldNGoGIOTJugzJnLw5wBbXMFBOAKf10OzjnogyXBwxV\nddJ5DK32KcbnT4VfPx2Pu5uIigFfoK2tOe1UJPjVcw+ymYlxQV9I7h8RbG+IAIAf\nTRkSrX5ARgCSYw0aeXtGyA==\n-----END PRIVATE KEY-----\n',
  'client_email': 'firebase-adminsdk-fbsvc@zed-world.iam.gserviceaccount.com',
  'client_id': '111200220581619054043',
  'auth_uri': 'https://accounts.google.com/o/oauth2/auth',
  'token_uri': 'https://oauth2.googleapis.com/token',
  'auth_provider_x509_cert_url': 'https://www.googleapis.com/oauth2/v1/certs',
  'client_x509_cert_url':
      'https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-fbsvc%40zed-world.iam.gserviceaccount.com',
  'universe_domain': 'googleapis.com'
};

// // Import the functions you need from the SDKs you need
// import { initializeApp } from "firebase/app";
// import { getAnalytics } from "firebase/analytics";
// // TODO: Add SDKs for Firebase products that you want to use
// // https://firebase.google.com/docs/web/setup#available-libraries

// // Your web app's Firebase configuration
// // For Firebase JS SDK v7.20.0 and later, measurementId is optional
// const firebaseConfig = {
//   apiKey: "AIzaSyCfqrWnHn5O7hXdKgqB8_C6h9K7KyIOX0o",
//   authDomain: "zed-world.firebaseapp.com",
//   projectId: "zed-world",
//   storageBucket: "zed-world.firebasestorage.app",
//   messagingSenderId: "458800408650",
//   appId: "1:458800408650:web:7552452abd940370ab5eb3",
//   measurementId: "G-7XVJHDHD07"
// };

// // Initialize Firebase
// const app = initializeApp(firebaseConfig);
// const analytics = getAnalytics(app);
