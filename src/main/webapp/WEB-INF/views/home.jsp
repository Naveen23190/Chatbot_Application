<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AI Teacher | Learn with Confidence</title>
    <style>
        :root {
            --ink: #172033;
            --muted: #65718a;
            --primary: #5b5ce2;
            --primary-dark: #4546c7;
            --surface: #ffffff;
            --line: #e7eaf3;
        }
        * { box-sizing: border-box; }
        body {
            margin: 0;
            min-height: 100vh;
            font-family: "Segoe UI", Arial, sans-serif;
            color: var(--ink);
            background:
                radial-gradient(circle at 12% 15%, rgba(116, 117, 255, .17), transparent 28rem),
                radial-gradient(circle at 90% 82%, rgba(64, 196, 180, .13), transparent 26rem),
                #f6f7fc;
            display: flex;
            flex-direction: column;
        }
        .topbar {
            width: 100%;
            padding: 22px clamp(20px, 6vw, 88px);
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 16px;
        }
        .brand { display: flex; align-items: center; gap: 11px; font-weight: 750; letter-spacing: -.3px; }
        .brand-mark {
            width: 42px; height: 42px; display: grid; place-items: center;
            color: #fff; background: linear-gradient(135deg, #7273f6, #4546c7);
            border-radius: 14px; font-size: 21px; box-shadow: 0 8px 20px #5b5ce233;
        }
        .top-note { color: var(--muted); font-size: 14px; }
        main {
            width: min(1120px, calc(100% - 40px));
            margin: auto; padding: 48px 0 72px;
            display: grid; grid-template-columns: 1.15fr .85fr;
            align-items: center; gap: clamp(28px, 6vw, 80px);
        }
        .eyebrow {
            display: inline-flex; align-items: center; gap: 8px;
            padding: 8px 12px; border: 1px solid #e1e2ff;
            border-radius: 999px; background: #fff; color: var(--primary-dark);
            font-size: 13px; font-weight: 700;
        }
        .eyebrow-dot { width: 7px; height: 7px; background: #40b99c; border-radius: 50%; }
        h1 { margin: 22px 0 18px; font-size: clamp(38px, 5vw, 64px); line-height: 1.06; letter-spacing: -2.4px; }
        h1 span { color: var(--primary); }
        .intro { max-width: 560px; color: var(--muted); font-size: 18px; line-height: 1.75; margin: 0 0 30px; }
        .actions { display: flex; align-items: center; gap: 18px; flex-wrap: wrap; }
        .button {
            display: inline-flex; justify-content: center; align-items: center; gap: 10px;
            padding: 15px 22px; background: var(--primary); color: white;
            border-radius: 13px; text-decoration: none; font-weight: 700;
            box-shadow: 0 12px 24px #5b5ce22e; transition: transform .18s, background .18s, box-shadow .18s;
        }
        .button:hover { background: var(--primary-dark); transform: translateY(-2px); box-shadow: 0 15px 28px #5b5ce23d; }
        .button:focus-visible { outline: 3px solid #9b9cff; outline-offset: 4px; }
        .helper { color: var(--muted); font-size: 13px; }
        .preview {
            position: relative; padding: 24px; border-radius: 28px; background: rgba(255,255,255,.78);
            border: 1px solid #ffffff; box-shadow: 0 30px 80px #303b6818;
            backdrop-filter: blur(10px);
        }
        .preview-head { display: flex; align-items: center; gap: 12px; padding-bottom: 18px; border-bottom: 1px solid var(--line); }
        .avatar { width: 44px; height: 44px; display: grid; place-items: center; border-radius: 15px; background: #eeefff; font-size: 22px; }
        .preview-head strong { display: block; font-size: 15px; }
        .preview-head small { display: block; margin-top: 4px; color: var(--muted); }
        .bubble { margin-top: 18px; padding: 15px 16px; border-radius: 17px; font-size: 14px; line-height: 1.65; }
        .bubble.user { margin-left: 32px; background: #efefff; border-bottom-right-radius: 5px; }
        .bubble.ai { margin-right: 18px; background: #fff; border: 1px solid var(--line); border-bottom-left-radius: 5px; }
        .tip { display: flex; align-items: flex-start; gap: 10px; margin-top: 22px; padding: 14px; border-radius: 14px; background: #f2fbf8; color: #3b7468; font-size: 13px; line-height: 1.5; }
        footer { padding: 20px; text-align: center; color: #8790a4; font-size: 12px; }
        @media (max-width: 760px) {
            .topbar { padding: 17px 20px; }
            .top-note { display: none; }
            main { grid-template-columns: 1fr; padding: 36px 0 48px; }
            .preview { max-width: 520px; width: 100%; margin: 0 auto; }
            h1 { letter-spacing: -1.5px; }
        }
        @media (prefers-reduced-motion: reduce) { *, *::before, *::after { transition: none !important; scroll-behavior: auto !important; } }
    </style>
</head>
<body>
    <header class="topbar">
        <div class="brand"><div class="brand-mark" aria-hidden="true">✦</div><span>Naveen</span></div>
        <div class="top-note">Your personal learning companion</div>
    </header>

    <main>
        <section>
            <div class="eyebrow"><span class="eyebrow-dot"></span> LEARN AT YOUR OWN PACE</div>
            <h1>Big questions.<br><span>Clear answers.</span></h1>
            <p class="intro">Meet your AI teacher — a friendly place to ask questions, explore new ideas, and understand complex concepts in simple language.</p>
            <div class="actions">
                <a class="button" href="${pageContext.request.contextPath}/ask">Start learning <span aria-hidden="true">→</span></a>
                <span class="helper">No question is too small.</span>
            </div>
        </section>

        <aside class="preview" aria-label="Example chat preview">
            <div class="preview-head">
                <div class="avatar" aria-hidden="true">✧</div>
                <div><strong>Your AI Teacher</strong><small>Here to help you understand</small></div>
            </div>
            <div class="bubble user">Can you explain a difficult topic in simple words?</div>
            <div class="bubble ai">Of course! I'll break it down step by step, use simple examples, and help you build your understanding.</div>
            <div class="tip"><span aria-hidden="true">✦</span><span><strong>Learning tip</strong><br>Ask follow-up questions whenever you want to explore an idea further.</span></div>
        </aside>
    </main>
    <footer>Created By Naveen</footer>
</body>
</html>
