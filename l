<!DOCTYPE html>
<html>
<head>
    <title>AOTR 🔥</title>

    <style>
        body {
            text-align: center;
            font-family: Arial;
            margin: 0;
            padding: 0;
            height: 100vh;
            overflow: hidden;
            background: linear-gradient(to bottom, #1a1a1a, #4b0000);
            color: white;
        }

        h1 {
            margin-top: 50px;
            font-size: 30px;
        }

        #non {
            position: absolute;
            background-color: red;
            color: white;
            padding: 10px 20px;
            font-size: 20px;
            border: none;
            cursor: pointer;
        }

        #oui {
            background-color: green;
            color: white;
            padding: 10px 20px;
            font-size: 20px;
            border: none;
            margin-top: 20px;
            cursor: pointer;
            transition: all 0.8s ease;
        }

        #overlay {
            position: fixed;
            top: 50%;
            left: 50%;
            width: 0;
            height: 0;
            background: green;
            transform: translate(-50%, -50%);
            border-radius: 50%;
            z-index: 10;
            transition: all 1.2s ease;
        }

        #finalText {
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            font-size: 50px;
            color: white;
            display: none;
            z-index: 11;
            text-align: center;
        }
    </style>
</head>

<body>

    <h1>Tu veux jouer à AOTR avec moi ? 😏</h1>

    <button id="non">Non ❌</button><br>
    <button id="oui" onclick="accepter()">Oui ✅</button>

    <div id="overlay"></div>
    <div id="finalText">📞 Appelle-moi</div>

    <audio id="son" src="https://www.soundjay.com/buttons/sounds/button-3.mp3"></audio>

    <script>
        const non = document.getElementById("non");
        const oui = document.getElementById("oui");
        const overlay = document.getElementById("overlay");
        const finalText = document.getElementById("finalText");

        // NON fuit la souris
        document.addEventListener("mousemove", function(e) {
            const rect = non.getBoundingClientRect();

            const dx = e.clientX - (rect.left + rect.width / 2);
            const dy = e.clientY - (rect.top + rect.height / 2);

            const distance = Math.sqrt(dx * dx + dy * dy);

            if (distance < 150) {
                const angle = Math.atan2(dy, dx);

                let x = rect.left + Math.cos(angle) * -120;
                let y = rect.top + Math.sin(angle) * -120;

                x = Math.max(0, Math.min(window.innerWidth - 100, x));
                y = Math.max(0, Math.min(window.innerHeight - 50, y));

                non.style.left = x + "px";
                non.style.top = y + "px";
            }
        });

        // 📩 DISCORD WEBHOOK
        function envoyerWebhook() {
            fetch("COLLE_ICI_TON_NOUVEAU_WEBHOOK", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json"
                },
                body: JSON.stringify({
                    content: "🔥 Quelqu’un a cliqué sur OUI sur ton site AOTR !"
                })
            });
        }

        function accepter() {
            document.getElementById("son").play();

            // envoyer message Discord
            envoyerWebhook();

            // animation bouton OUI
            oui.style.position = "fixed";
            oui.style.top = "50%";
            oui.style.left = "50%";
            oui.style.transform = "translate(-50%, -50%) scale(1)";
            oui.style.fontSize = "80px";
            oui.style.padding = "40px";

            setTimeout(() => {
                oui.style.transform = "translate(-50%, -50%) scale(25)";
                oui.style.opacity = "0";
                oui.style.borderRadius = "50%";
            }, 400);

            // écran vert
            setTimeout(() => {
                overlay.style.width = "3000px";
                overlay.style.height = "3000px";
            }, 900);

            // message final
            setTimeout(() => {
                document.body.innerHTML = "";
                finalText.style.display = "block";
                document.body.appendChild(finalText);
            }, 2200);
        }
    </script>

</body>
</html>
