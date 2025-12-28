const request = require("supertest");
const app = require("./index");

describe("GET /hello", () => {
  it("should return Hello World", async () => {
    const response = await request(app).get("/");

    expect(response.statusCode).toBe(200);
    expect(response.body.message).toEqual("Hello, World!");
  });
});
