import jwt from "jsonwebtoken";
import dotenv from "dotenv"; // aluth version nisa ---

dotenv.config();

export function auth(req, res, next) {
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

    jwt.verify(token, process.env.TOKEN_KEY_CUSTOMER, (err, user) => {
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

export function Adminauth(req, res, next) {
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

    jwt.verify(token, "123456Admin", (err, user) => {
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

// export function auth(req, res, next) {
//   const token = req.cookies.authcookie; // Retrieve the token from the "authcookie" cookie
//   console.log(token);

//   if (token) {
//     try {
//       console.log("decoded1");
//       const decoded = jwt.verify(token, process.env.TOKEN_KEY_CUSTOMER); // Verify the token using your secret key
//       console.log("decoded");
//       console.log(decoded);
//       req.user = decoded.user; // Attach the user information to the request
//       next(); // Proceed to the next middleware or route
//     } catch (error) {
//       res
//         .status(401)
//         .json({ success: false, message: "Authentication failed" });
//     }
//   } else {
//     res
//       .status(401)
//       .json({ success: false, message: "Authentication required" });
//   }
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
