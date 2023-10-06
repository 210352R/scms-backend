import jwt from "jsonwebtoken";
import dotenv from "dotenv"; // aluth version nisa ---

dotenv.config();

export default function auth(req, res, next) {
  //get authcookie from request

  if (
    req?.headers.authorization &&
    req?.headers.authorization.startsWith("Bearer")
  ) {
    //meke [0] element eka thamai "Bearer" [1] ta thamai token eka denne
    const token = req?.headers.authorization.split(" ")[1];
    console.log(token);
    if (token == null) {
      res.send(401).json({
        message: "Not authorized --- ",
        success: false,
      });
    }

    jwt.verify(token, "123456", (err, user) => {
      if (err) {
        res.status(200).json({
          message: "Prohibidden",
          success: false,
        });
      } else {
        console.log("Wade goda -----------");
        // req.headers['x-custom-header'] = 'CustomHeaderValue';
        req.user = user; //req ekata user ekenek danawa ---
        next();
      }
    });
  } else {
    console.log("Hello World ------ ");
    res.status(200).json({
      message: "Access Denied",
      success: false,
    });
  }
}

// export default function auth(req, res, next) {
//   const authCookie = req.cookies.authcookie;
//   console.log("Auth Cookie : ", authCookie);
//   const token = authCookie;
//   console.log("Token : ", token);

//   if (token == null) {
//     res.send(401).json({
//       message: "Not authorized --- ",
//     });
//   }
//   jwt.verify(token, "123456", (err, user) => {
//     if (err) {
//       res.status(403).json({
//         message: "Prohibidden",
//       });
//     }
//     console.log("Task successfull using cookies --- -----------");
//     req.user = user; //req ekata user ekenek danawa ---
//     next();
//   });
// }

// next();
//get authcookie from request
// if (
//   req?.headers.authorization &&
//   req?.headers.authorization.startsWith("Bearer")
// ) {
//   //meke [0] element eka thamai "Bearer" [1] ta thamai token eka denne
//   const token = req?.headers.authorization.split(" ")[1];
//   console.log(token);
//   if (token == null) {
//     res.send(401).json({
//       message: "Not authorized --- ",
//     });
//   }
//   jwt.verify(token, "123456", (err, user) => {
//     if (err) {
//       res.status(403).json({
//         message: "Prohibidden",
//       });
//     }
//     console.log("Wade goda -----------");
//     req.user = user; //req ekata user ekenek danawa ---
//     next();
//   });
// } else {
//   res.status(401).json({
//     message: "Access Denied",
//   });
// }
//}
