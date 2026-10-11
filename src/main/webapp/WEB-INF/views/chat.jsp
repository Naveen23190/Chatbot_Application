<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chat with Your AI Teacher</title>
    <style>
        :root { --ink: #172033; --muted: #68738a; --primary: #5b5ce2; --primary-dark: #4546c7; --line: #e6e9f2; }
        * { box-sizing: border-box; }
        body {
            margin: 0; min-height: 100vh; font-family: "Segoe UI", Arial, sans-serif; color: var(--ink);
            background: radial-gradient(circle at 5% 5%, #7778f21b, transparent 25rem), #f6f7fc;
        }
        .topbar { display: flex; align-items: center; justify-content: space-between; gap: 16px; padding: 18px clamp(18px, 5vw, 64px); border-bottom: 1px solid #e8eaf2; background: #ffffffd9; }
        .brand { display: flex; align-items: center; gap: 10px; font-weight: 750; }
        .brand-mark { width: 38px; height: 38px; display: grid; place-items: center; border-radius: 12px; background: linear-gradient(135deg, #7273f6, #4546c7); color: white; font-size: 20px; }
        .back-link { color: var(--muted); text-decoration: none; font-size: 14px; font-weight: 600; }
        .back-link:hover { color: var(--primary); }
        .back-link:focus-visible, button:focus-visible, textarea:focus-visible { outline: 3px solid #a5a6ff; outline-offset: 3px; }
        main { width: min(850px, calc(100% - 32px)); margin: 42px auto 60px; }
        .page-intro { text-align: center; margin-bottom: 26px; }
        .page-intro .eyebrow { color: var(--primary); font-size: 12px; letter-spacing: 1.5px; font-weight: 800; }
        h1 { margin: 10px 0 8px; font-size: clamp(29px, 4vw, 40px); letter-spacing: -1px; }
        .page-intro p { margin: 0; color: var(--muted); line-height: 1.6; }
        .chat-card { overflow: hidden; background: #fff; border: 1px solid var(--line); border-radius: 22px; box-shadow: 0 20px 60px #303b6810; }
        .card-head { display: flex; align-items: center; gap: 12px; padding: 19px 22px; border-bottom: 1px solid var(--line); }
        .avatar { width: 43px; height: 43px; flex: 0 0 auto; display: grid; place-items: center; border-radius: 14px; background: #efefff; font-size: 21px; }
        .card-head strong { display: block; }
        .card-head small { display: block; margin-top: 4px; color: var(--muted); }
        .status { margin-left: auto; color: #238a70; font-size: 12px; font-weight: 700; white-space: nowrap; }
        .chat-body { padding: clamp(18px, 4vw, 30px); }
        .field-label { display: block; margin-bottom: 10px; font-size: 14px; font-weight: 750; }
        textarea {
            width: 100%; min-height: 145px; resize: vertical; padding: 16px;
            border: 1px solid #dfe3ef; border-radius: 14px; background: #fcfcff;
            font: inherit; font-size: 15px; line-height: 1.65; color: var(--ink);
            transition: border-color .18s, box-shadow .18s;
        }
        textarea:focus { outline: none; border-color: #7778ed; box-shadow: 0 0 0 4px #7778ed20; }
        .form-foot { display: flex; justify-content: space-between; align-items: center; gap: 14px; margin-top: 13px; }
        .counter { color: var(--muted); font-size: 12px; }
        .button-row { display: flex; align-items: center; gap: 10px; }
        button { cursor: pointer; border: 0; font: inherit; font-weight: 750; }
        .submit-button { display: inline-flex; align-items: center; justify-content: center; gap: 9px; min-height: 46px; padding: 12px 19px; border-radius: 12px; background: var(--primary); color: #fff; box-shadow: 0 8px 18px #5b5ce226; transition: background .18s, transform .18s; }
        .submit-button:hover { background: var(--primary-dark); transform: translateY(-1px); }
        .submit-button:disabled { cursor: wait; opacity: .7; transform: none; }
        .clear-button { min-height: 42px; padding: 10px 12px; border-radius: 10px; background: #f1f2f8; color: #505b72; }
        .clear-button:hover { background: #e8eaf4; }
        .notice { margin: 0 0 20px; padding: 14px 16px; border-radius: 12px; line-height: 1.6; font-size: 14px; overflow-wrap: anywhere; }
        .error { background: #fff1f1; border: 1px solid #ffd6d6; color: #a52c37; }
        .answer { margin-top: 24px; border: 1px solid #dfe5f4; border-radius: 16px; overflow: hidden; }
        .answer-head { display: flex; align-items: center; gap: 9px; padding: 15px 18px; background: #f4f4ff; color: #4143b8; font-weight: 800; font-size: 14px; }
        .answer-content { padding: 20px; font-size: 15px; line-height: 1.8; white-space: pre-wrap; overflow-wrap: anywhere; }
        .answer-content p { margin: 0; }
        .hint { margin: 18px 2px 0; color: var(--muted); text-align: center; font-size: 12px; line-height: 1.6; }
        footer { padding: 20px; text-align: center; color: #8790a4; font-size: 12px; }
        @media (max-width: 520px) {
            .topbar { padding: 14px 16px; }
            .status { display: none; }
            main { margin-top: 28px; }
            .card-head { padding: 16px; }
            .form-foot { align-items: stretch; flex-direction: column; }
            .counter { order: 2; }
            .button-row { justify-content: flex-end; }
            .submit-button { flex: 1; }
        }
        @media (prefers-reduced-motion: reduce) { *, *::before, *::after { transition: none !important; } }
    </style>
</head>
<body>
    <header class="topbar">
        <div class="brand"><div class="brand-mark" aria-hidden="true">✦</div><span>Naveen</span></div>
        <a class="back-link" href="${pageContext.request.contextPath}/">← Back to home</a>
    </header>

    <main>
        <section class="page-intro">
            <div class="eyebrow">YOUR LEARNING SPACE</div>
            <h1>What would you like to learn?</h1>
            <p>Ask a question and your AI teacher will explain it in beginner-friendly language.</p>
        </section>

        <section class="chat-card" aria-label="AI teacher chat">
            <div class="card-head">
                <div class="avatar" aria-hidden="true">✧</div>
                <div><strong>AI Teacher</strong><small>Ready to help with your question</small></div>
                <span class="status">● Ready</span>
            </div>
            <div class="chat-body">
                <c:if test="${not empty error}">
                    <div class="notice error" role="alert"><strong>We couldn't get an answer.</strong><br><c:out value="${error}"/></div>
                </c:if>

                <form id="questionForm" action="${pageContext.request.contextPath}/chat" method="post">
                    <label class="field-label" for="userText">Your question</label>
                    <textarea id="userText" name="userText" maxlength="5000"
                        placeholder="For example: Explain Java inheritance with a simple example..."
                        required><c:out value="${userText}"/></textarea>
                    <div class="form-foot">
                        <span class="counter"><span id="charCount">0</span>/5000 characters</span>
                        <div class="button-row">
                            <button class="clear-button" type="button" id="clearButton">Clear</button>
                            <button class="submit-button" type="submit" id="submitButton">
                                <span id="buttonText">Ask Gemini</span><span aria-hidden="true">→</span>
                            </button>
                        </div>
                    </div>
                </form>

                <c:if test="${not empty answer}">
                    <section class="answer" aria-live="polite">
                        <div class="answer-head"><span aria-hidden="true">✦</span> AI Teacher's Answer</div>
                        <div class="answer-content"><c:out value="${answer}"/></div>
                    </section>
                </c:if>
            </div>
        </section>
        <p class="hint">Tip: Ask one clear question at a time. AI responses may occasionally contain mistakes.</p>
    </main>
    <footer>Created By Naveen</footer>

    <script>
        (function () {
            const form = document.getElementById('questionForm');
            const textarea = document.getElementById('userText');
            const count = document.getElementById('charCount');
            const clearButton = document.getElementById('clearButton');
            const submitButton = document.getElementById('submitButton');
            const buttonText = document.getElementById('buttonText');

            function updateCount() {
                count.textContent = textarea.value.length;
            }

            textarea.addEventListener('input', updateCount);
            clearButton.addEventListener('click', function () {
                textarea.value = '';
                updateCount();
                textarea.focus();
            });
            form.addEventListener('submit', function () {
                if (!textarea.value.trim()) {
                    textarea.value = '';
                    textarea.focus();
                    return;
                }
                submitButton.disabled = true;
                buttonText.textContent = 'Thinking...';
            });

            updateCount();
        })();
    </script>
</body>
</html>
