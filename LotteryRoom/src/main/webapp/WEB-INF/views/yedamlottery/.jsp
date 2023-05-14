<%@page import="java.util.HashSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>수동 선택</title>
    <style>
        .btn {
            padding: 10px 20px;
            margin: 5px;
            background-color: lightgray;
            border: 1px solid darkgray;
            cursor: pointer;
        }
        .btn-selected {
            background-color: green;
            color: white;
        }
        #button-container {
            display: grid;
            grid-template-columns: repeat(7, 1fr);
            gap: 10px;
            justify-items: center;
            margin: 0 auto;
            width: 80%;
            max-width: 500px;
        }
    </style>
</head>
<body>
    <div id="button-container"></div>
    <div class="deposit"></div>

    <script>
        const buttonContainer = document.getElementById('button-container');

        for (let i = 1; i <= 45; i++) {
            const btn = document.createElement('button');
            btn.className = 'btn';
            btn.innerText = i;
            btn.onclick = function () {
                toggleColor(this);
            };

            buttonContainer.appendChild(btn);
        }

        let selectedCount = 0;

        function toggleColor(btn) {
            if (btn.classList.contains("btn-selected")) {
                btn.classList.remove("btn-selected");
                selectedCount--;
            } else {
                if (selectedCount < 6) {
                    btn.classList.add("btn-selected");
                    selectedCount++;
                }
            }
        }
        
        let deposit = document.querySelector('deposit');
        deposit = document.createElement('button');
        deposit.innerText = "저장하기";
        deposit.type="button";
    </script>
</body>
</html>
