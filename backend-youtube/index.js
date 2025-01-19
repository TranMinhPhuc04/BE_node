// import thư viện expressJS
import express from "express";
import connect from "./db.js";
import rootRoutes from "./src/routes/rootRoutes.js";

// khởi tạo ứng dụng express
const app = express();

// parse body từ string => JSON
app.use(express.json());

// import rootRoutes
app.use(rootRoutes);

// tạo API
// param1: path của API
// param2: callback function
app.get("/welcome", (req, res) => {
  // trả dữ liệu về cho client (FE, postman, ...)
  // dùng res
  return res.send("welcome to node48");
});

// lấy infomation từ request (header, body, params, query)
// 1. params:
app.get("/users/:id/:hoTen", (req, res) => {
  // lấy giá trị id từ params
  //   const id = req.params.id;
  // lưu ý: define bao nhiêu params thì phải truyền
  // đúng số params đó vào URL
  // define tên params nào thì phải lấy đúng tên đó
  // VD: /users/:id
  // const id = req.params.id;
  // const id = req.params.id1; => undefined(null)
  const { id } = req.params; // destructuring
  // debug log
  // => dùng console.log
  const params = req.params;
  console.log(params);

  return res.send(`value id: ${id}`); // trả về dạng string
});

// 2. query
// URL: /users?id=1&hoTen=abc
app.get("/get-query", (req, res) => {
  // lấy giá trị từ query
  // lưu ý: method GET và DELETE sẽ không có body
  const query = req.query;

  return res.send({ query }); // trả về dạng JSON
});

// 3. lấy information từ header request
// header giúp bảo vệ API
app.get("/get-header", (req, res) => {
  // lấy giá trị từ header từ resquest
  const headers = req.headers;

  return res.send({ headers });
});

// get body request
// method POST, PUT mới có body
app.post("/get-body", (req, res) => {
  // lấy giá trị body từ request
  // lưu ý: body phải có dạng JSON
  const body = req.body;

  return res.send({ body });
});

// viết API kết nối với database
// app.get("/get-users", async (req, res) => {
//   try {
//     const [data] = await connect.query(`
//       SELECT * FROM users
//     `);

//     return res.send(data);
//   } catch (error) {
//     return res.send(`Error: ${error}`);
//   }
// });

// viết API create user
app.post("/create-user", async (req, res) => {
  try {
    const queryString = `
      INSERT INTO users(full_name, email, pass_word) VALUES
      (?, ?, ?)
    `;
    let body = req.body;
    let { full_name, email, pass_word } = body; // destructuring
    // thực thi query
    const [data] = await connect.execute(queryString, [
      full_name,
      email,
      pass_word,
    ]);
    return res.send(data);
  } catch (error) {
    return res.send(`Error: ${error}`);
  }
});

// khai báo port mà BE sẽ lắng nghe
const port = 3000;
// param1: port
// param2: callbacl function
// () => {}: style define function theo kiểu ES6
app.listen(port, () => {
  console.log(`BE is running with port ${port}`);
});
