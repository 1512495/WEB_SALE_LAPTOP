var express = require("express");
var exphbs = require("express-handlebars");
var express_handlebars_sections = require("express-handlebars-sections");
var bodyParser = require("body-parser");
var path = require("path");
var wnumb = require("wnumb");
var session = require("express-session");

var MySQLStore = require("express-mysql-session")(session);

var handle404MDW = require("./middle-wares/handle404"),
  handleLayoutMDW = require("./middle-wares/handleLayout"),
  restrict = require("./middle-wares/restrict");

var homeController = require("./controllers/homeController");
var accountController = require("./controllers/accountController");
var producerController = require("./controllers/producerController");
var typeController = require("./controllers/typeController");
var adminController = require("./controllers/adminController");
var productController = require("./controllers/productController");
var orderController = require("./controllers/orderController");
var cartController = require("./controllers/cartController");
var app = express();

//set engine
app.engine(
  "hbs",
  exphbs({
    defaultLayout: "main",
    layoutsDir: "views/_layouts/",
    helpers: {
      section: express_handlebars_sections(),
      number_format: n => {
          var nf = wnumb({
              thousand: ','
          });
          return nf.to(n);
      }
  }
  })
);
app.set("view engine", "hbs");

app.use(express.static(path.resolve(__dirname, "public")));

app.use(bodyParser.json());
app.use(
  bodyParser.urlencoded({
    extended: false
  })
);

var sessionStore = new MySQLStore({
  host: "localhost",
  port: 3306,
  user: "root",
  password: "",
  database: "laptop",
  createDatabaseTable: true,
  schema: {
    tableName: "sessions",
    columnNames: {
      session_id: "session_id",
      expires: "expires",
      data: "data"
    }
  }
});

app.use(
  session({
    key: "session_cookie_name",
    secret: "session_cookie_secret",
    store: sessionStore,
    resave: false,
    saveUninitialized: false
  })
);

app.use(handleLayoutMDW);
// session
// app.use(
//   session({
//     secret: "keyboard cat",
//     resave: false,
//     saveUninitialized: true
//     // cookie: {
//     //     secure: true
//     // }
//   })
// );

app.use("/", homeController);
app.use("/account", accountController);
app.use("/admin", restrict, adminController);
app.use("/admin/producer", restrict, producerController);
app.use("/admin/type", restrict, typeController);
app.use("/admin/product", restrict, productController);
app.use("/product", productController);
app.use("/admin/order", restrict, orderController);
app.use("/cart", restrict, cartController);
app.use(handle404MDW);
app.listen(3000, () => {
  console.log("Site running on port 3000");
});

// app.get("/", (req, res) => {
//   res.redirect("/home");
// });
