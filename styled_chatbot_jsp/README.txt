# BrightPath AI JSP pages

## Install
Copy `home.jsp` and `chat.jsp` into:
`src/main/webapp/WEB-INF/views/`

Keep these controller mappings:
- `GET /` returns `home`
- `GET /ask` returns `chat`
- `POST /chat` accepts `userText`, and adds `answer` or `error` to the model

The styles are embedded in each JSP; no separate CSS or JavaScript files are required.
The chat page uses the Jakarta JSTL core tag library (`jakarta.tags.core`) as in the original file.
