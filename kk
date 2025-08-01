<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Friendship Day Journey</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Comic Sans MS', cursive, sans-serif;
            background: linear-gradient(135deg, #ffcce6, #ccf2ff);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            overflow: hidden;
            transition: background 1s ease;
        }

        .container {
            text-align: center;
            position: relative;
            z-index: 10;
            max-width: 800px;
            padding: 30px;
            background: rgba(255, 255, 255, 0.9);
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            transform: scale(0.95);
            transition: all 0.5s ease;
        }

        .container:hover {
            transform: scale(1);
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.2);
        }

        h1 {
            color: #ff66b3;
            font-size: 2.8rem;
            margin-bottom: 20px;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.1);
        }

        .btn {
            background: linear-gradient(45deg, #ff66b3, #ff9999);
            color: white;
            border: none;
            padding: 15px 40px;
            font-size: 1.2rem;
            border-radius: 50px;
            cursor: pointer;
            margin: 15px;
            transition: all 0.3s ease;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            position: relative;
            overflow: hidden;
        }

        .btn:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.2);
        }

        .btn:active {
            transform: translateY(0);
        }

        .btn::after {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: rgba(255,255,255,0.1);
            transform: rotate(30deg);
            transition: all 0.3s ease;
        }

        .btn:hover::after {
            left: 100%;
        }

        .heart {
            position: absolute;
            pointer-events: none;
            font-size: 20px;
            color: #ff66b3;
            animation: float 4s ease-in-out infinite;
            opacity: 0;
            z-index: 1;
        }

        .friendship-icon {
            font-size: 5rem;
            margin: 20px 0;
            cursor: pointer;
            display: inline-block;
            transition: all 0.3s ease;
        }

        .hidden {
            display: none;
            opacity: 0;
            transform: translateY(20px);
        }

        .step {
            transition: all 0.8s ease;
            max-height: 0;
            overflow: hidden;
            opacity: 0;
        }

        .step.active {
            max-height: 1000px;
            opacity: 1;
            transform: translateY(0);
        }

        .photo-frame {
            width: 200px;
            height: 200px;
            border-radius: 50%;
            border: 5px solid #ff66b3;
            margin: 20px auto;
            overflow: hidden;
            box-shadow: 0 10px 25px rgba(0,0,0,0.15);
            transition: all 0.5s ease;
            position: relative;
        }

        .photo-frame:hover {
            transform: scale(1.05) rotate(5deg);
            box-shadow: 0 15px 35px rgba(0,0,0,0.2);
        }

        .photo-frame img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.5s ease;
        }

        .memory-scroll {
            height: 200px;
            overflow-y: auto;
            margin: 20px 0;
            padding: 10px;
            background: rgba(255,255,255,0.7);
            border-radius: 10px;
            scrollbar-width: thin;
            scrollbar-color: #ff66b3 #ffe6f2;
        }

        .memory-scroll::-webkit-scrollbar {
            width: 8px;
        }

        .memory-scroll::-webkit-scrollbar-track {
            background: #ffe6f2;
            border-radius: 10px;
        }

        .memory-scroll::-webkit-scrollbar-thumb {
            background-color: #ff66b3;
            border-radius: 10px;
        }

        .memory-item {
            background: white;
            padding: 15px;
            margin: 10px 0;
            border-radius: 10px;
            box-shadow: 0 3px 10px rgba(0,0,0,0.05);
            transform: scale(0.95);
            transition: all 0.3s ease;
        }

        .memory-item:hover {
            transform: scale(1);
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }

        .progress-container {
            width: 100%;
            height: 10px;
            background: #ffe6f2;
            border-radius: 5px;
            margin: 20px 0;
            overflow: hidden;
        }

        .progress-bar {
            height: 100%;
            background: linear-gradient(90deg, #ff66b3, #ff9999);
            width: 0;
            transition: width 1s ease;
            border-radius: 5px;
        }

        .friendship-meter {
            font-size: 1.5rem;
            color: #ff66b3;
            margin: 10px 0;
        }

        .polaroid {
            background: white;
            padding: 15px 15px 60px 15px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            transform: rotate(-3deg);
            transition: all 0.3s ease;
            margin: 20px auto;
            max-width: 250px;
        }

        .polaroid:hover {
            transform: rotate(0deg) scale(1.05);
        }

        .polaroid img {
            width: 100%;
            height: auto;
            margin-bottom: 10px;
        }

        .polaroid p {
            font-style: italic;
            color: #666;
            margin: 0;
        }

        @keyframes float {
            0% { transform: translateY(0) rotate(0deg); }
            50% { transform: translateY(-20px) rotate(10deg); }
            100% { transform: translateY(0) rotate(0deg); }
        }

        @keyframes pulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.1); }
            100% { transform: scale(1); }
        }

        @keyframes shake {
            0% { transform: translateX(0); }
            25% { transform: translateX(-10px); }
            50% { transform: translateX(10px); }
            75% { transform: translateX(-10px); }
            100% { transform: translateX(0); }
        }

        .shake {
            animation: shake 0.5s ease;
        }

        .typewriter {
            overflow: hidden;
            border-right: 3px solid #ff66b3;
            white-space: nowrap;
            margin: 0 auto;
            letter-spacing: 2px;
            animation: typing 3.5s steps(40, end), blink-caret 0.75s step-end infinite;
        }

        @keyframes typing {
            from { width: 0 }
            to { width: 100% }
        }

        @keyframes blink-caret {
            from, to { border-color: transparent }
            50% { border-color: #ff66b3; }
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Step 1: Initial Greeting -->
        <div class="step active" id="step1">
            <div class="friendship-icon">👬</div>
            <h1>Happy Friendship Day!</h1>
            <div class="photo-frame">
                <img src="https://i.imgur.com/JqYeYnW.jpg" alt="Best Friends" id="friendPhoto">
            </div>
            <p>Ready to celebrate our amazing friendship?</p>
            <button class="btn" id="startBtn">Let's Begin!</button>
        </div>

        <!-- Step 2: Memory Lane -->
        <div class="step" id="step2">
            <h1><span class="typewriter">Walk Down Memory Lane</span></h1>
            <div class="memory-scroll" id="memoryScroll">
                <!-- Memories will be added by JavaScript -->
            </div>
            <button class="btn" id="nextBtn1">These are wonderful!</button>
        </div>

        <!-- Step 3: Friendship Test -->
        <div class="step" id="step3">
            <h1>How Well Do You Know Me?</h1>
            <div id="quizContainer">
                <!-- Quiz questions will be added by JavaScript -->
            </div>
            <div class="progress-container">
                <div class="progress-bar" id="quizProgress"></div>
            </div>
            <button class="btn hidden" id="nextBtn2">Continue Our Journey</button>
        </div>

        <!-- Step 4: Photo Gallery -->
        <div class="step" id="step4">
            <h1>Our Special Moments</h1>
            <div id="galleryContainer">
                <div class="polaroid">
                    <img src="https://i.imgur.com/JqYeYnW.jpg" alt="Memory 1">
                    <p>The day we first met!</p>
                </div>
                <div class="polaroid">
                    <img src="https://i.imgur.com/LSmzvf3.jpg" alt="Memory 2">
                    <p>Celebrating together!</p>
                </div>
                <div class="polaroid">
                    <img src="https://i.imgur.com/5WXWQ9i.jpg" alt="Memory 3">
                    <p>Best friends forever!</p>
                </div>
            </div>
            <button class="btn" id="nextBtn3">You're the Best!</button>
        </div>

        <!-- Step 5: Final Celebration -->
        <div class="step" id="step5">
            <h1>To My Amazing Friend</h1>
            <div class="friendship-meter">
                Friendship Level: <span id="friendshipPercent">100</span>%
            </div>
            <div class="progress-container">
                <div class="progress-bar" id="friendshipMeter" style="width: 100%"></div>
            </div>
            <div class="photo-frame">
                <img src="https://i.imgur.com/LSmzvf3.jpg" alt="Celebration">
            </div>
            <p id="finalMessage">No matter where life takes us, you'll always be my best friend!</p>
            <button class="btn" id="celebrateBtn">Celebrate Our Friendship!</button>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // DOM Elements
            const steps = document.querySelectorAll('.step');
            const startBtn = document.getElementById('startBtn');
            const nextBtn1 = document.getElementById('nextBtn1');
            const nextBtn2 = document.getElementById('nextBtn2');
            const nextBtn3 = document.getElementById('nextBtn3');
            const celebrateBtn = document.getElementById('celebrateBtn');
            const memoryScroll = document.getElementById('memoryScroll');
            const quizContainer = document.getElementById('quizContainer');
            const quizProgress = document.getElementById('quizProgress');
            const friendshipMeter = document.getElementById('friendshipMeter');
            const friendshipPercent = document.getElementById('friendshipPercent');
            const finalMessage = document.getElementById('finalMessage');
            
            // Current step tracker
            let currentStep = 0;
            let quizScore = 0;
            let totalQuestions = 3;
            
            // Memories data
            const memories = [
                "Remember when we first met? It was like we'd known each other forever!",
                "That time we stayed up all night talking about our dreams - I'll never forget that!",
                "All the laughs we've shared could probably power a small city!",
                "Through thick and thin, you've always been there for me.",
                "Our inside jokes could fill an entire dictionary!",
                "No matter what happens, I know I can always count on you.",
                "You've seen me at my best and my worst, and still stick around!"
            ];
            
            // Quiz questions
            const quizQuestions = [
                {
                    question: "What's my favorite color?",
                    options: ["Blue", "Red", "Green", "Pink"],
                    answer: 0
                },
                {
                    question: "What's my favorite food?",
                    options: ["Pizza", "Sushi", "Burgers", "Tacos"],
                    answer: 1
                },
                {
                    question: "How long have we been friends?",
                    options: ["1 year", "3 years", "5 years", "Since forever!"],
                    answer: 3
                }
            ];
            
            // Initialize the page
            initMemories();
            initQuiz();
            
            // Button event listeners
            startBtn.addEventListener('click', nextStep);
            nextBtn1.addEventListener('click', nextStep);
            nextBtn2.addEventListener('click', nextStep);
            nextBtn3.addEventListener('click', nextStep);
            celebrateBtn.addEventListener('click', celebrateFriendship);
            
            // Create floating hearts
            function createHearts() {
                const heart = document.createElement('div');
                heart.className = 'heart';
                heart.innerHTML = ['❤️', '💖', '💕', '💓', '💗'][Math.floor(Math.random() * 5)];
                heart.style.left = Math.random() * 100 + 'vw';
                heart.style.top = Math.random() * 100 + 'vh';
                heart.style.fontSize = (Math.random() * 25 + 15) + 'px';
                heart.style.animationDuration = (Math.random() * 4 + 3) + 's';
                heart.style.opacity = '1';
                document.body.appendChild(heart);
                
                setTimeout(() => {
                    heart.remove();
                }, 5000);
            }
            
            // Set interval for floating hearts
            setInterval(createHearts, 400);
            
            // Initialize memories
            function initMemories() {
                memories.forEach((memory, index) => {
                    setTimeout(() => {
                        const memoryItem = document.createElement('div');
                        memoryItem.className = 'memory-item';
                        memoryItem.textContent = memory;
                        memoryScroll.appendChild(memoryItem);
                        
                        // Fade in effect
                        setTimeout(() => {
                            memoryItem.style.opacity = '1';
                            memoryItem.style.transform = 'scale(1)';
                        }, 100);
                    }, index * 300);
                });
            }
            
            // Initialize quiz
            function initQuiz() {
                quizQuestions.forEach((question, qIndex) => {
                    const questionDiv = document.createElement('div');
                    questionDiv.className = 'memory-item hidden';
                    questionDiv.id = `question-${qIndex}`;
                    
                    const questionText = document.createElement('h3');
                    questionText.textContent = question.question;
                    questionDiv.appendChild(questionText);
                    
                    question.options.forEach((option, oIndex) => {
                        const optionBtn = document.createElement('button');
                        optionBtn.className = 'btn';
                        optionBtn.style.margin = '5px';
                        optionBtn.style.padding = '8px 15px';
                        optionBtn.style.fontSize = '1rem';
                        optionBtn.textContent = option;
                        
                        optionBtn.addEventListener('click', function() {
                            checkAnswer(qIndex, oIndex, optionBtn);
                        });
                        
                        questionDiv.appendChild(optionBtn);
                    });
                    
                    quizContainer.appendChild(questionDiv);
                });
                
                // Show first question
                document.getElementById('question-0').classList.remove('hidden');
            }
            
            // Check quiz answer
            function checkAnswer(qIndex, oIndex, button) {
                const question = quizQuestions[qIndex];
                const allOptions = document.querySelectorAll(`#question-${qIndex} .btn`);
                
                // Disable all options
                allOptions.forEach(opt => {
                    opt.disabled = true;
                });
                
                // Mark correct answer
                if (oIndex === question.answer) {
                    button.style.background = 'linear-gradient(45deg, #66ff66, #99ff99)';
                    quizScore++;
                } else {
                    button.style.background = 'linear-gradient(45deg, #ff6666, #ff9999)';
                    allOptions[question.answer].style.background = 'linear-gradient(45deg, #66ff66, #99ff99)';
                }
                
                // Update progress
                quizProgress.style.width = `${((qIndex + 1) / quizQuestions.length) * 100}%`;
                
                // Show next question or finish
                setTimeout(() => {
                    if (qIndex < quizQuestions.length - 1) {
                        document.getElementById(`question-${qIndex}`).classList.add('hidden');
                        document.getElementById(`question-${qIndex + 1}`).classList.remove('hidden');
                    } else {
                        // Quiz complete
                        const scorePercent = Math.round((quizScore / quizQuestions.length) * 100);
                        friendshipMeter.style.width = `${scorePercent}%`;
                        friendshipPercent.textContent = scorePercent;
                        
                        // Update final message based on score
                        if (scorePercent >= 80) {
                            finalMessage.textContent = "You know me so well! We're truly best friends forever!";
                        } else if (scorePercent >= 50) {
                            finalMessage.textContent = "You know me pretty well! Let's make more memories together!";
                        } else {
                            finalMessage.textContent = "We need to spend more time together! Let's make up for it!";
                        }
                        
                        nextBtn2.classList.remove('hidden');
                    }
                }, 1500);
            }
            
            // Move to next step
            function nextStep() {
                // Hide current step
                steps[currentStep].classList.remove('active');
                
                // Show next step
                currentStep++;
                steps[currentStep].classList.add('active');
                
                // Special effects for certain steps
                if (currentStep === 1) {
                    // Memory lane step - scroll to bottom
                    setTimeout(() => {
                        memoryScroll.scrollTo({
                            top: memoryScroll.scrollHeight,
                            behavior: 'smooth'
                        });
                    }, 500);
                } else if (currentStep === 4) {
                    // Final step - celebration
                    setTimeout(() => {
                        for (let i = 0; i < 50; i++) {
                            setTimeout(createHearts, i * 100);
                        }
                    }, 500);
                }
            }
            
            // Final celebration
            function celebrateFriendship() {
                // Mega celebration
                for (let i = 0; i < 100; i++) {
                    setTimeout(() => {
                        createHearts();
                        
                        // Create larger hearts sometimes
                        if (i % 5 === 0) {
                            const bigHeart = document.createElement('div');
                            bigHeart.className = 'heart';
                            bigHeart.innerHTML = '❤️';
                            bigHeart.style.left = Math.random() * 100 + 'vw';
                            bigHeart.style.top = Math.random() * 100 + 'vh';
                            bigHeart.style.fontSize = '40px';
                            bigHeart.style.animationDuration = '6s';
                            bigHeart.style.opacity = '1';
                            document.body.appendChild(bigHeart);
                            
                            setTimeout(() => {
                                bigHeart.remove();
                            }, 6000);
                        }
                    }, i * 50);
                }
                
                // Change background
                document.body.style.background = 'linear-gradient(135deg, #ff66b3, #66b3ff)';
                
                // Change button text
                celebrateBtn.textContent = "Best Friends Forever! 💖";
                celebrateBtn.style.animation = 'pulse 1s infinite';
                
                // Add fireworks effect
                createFireworks();
            }
            
            // Fireworks effect
            function createFireworks() {
                const colors = ['#ff66b3', '#66b3ff', '#ffcc66', '#66ff66', '#b366ff'];
                
                for (let i = 0; i < 30; i++) {
                    setTimeout(() => {
                        const firework = document.createElement('div');
                        firework.style.position = 'fixed';
                        firework.style.left = Math.random() * 100 + 'vw';
                        firework.style.top = Math.random() * 100 + 'vh';
                        firework.style.width = '5px';
                        firework.style.height = '5px';
                        firework.style.borderRadius = '50%';
                        firework.style.backgroundColor = colors[Math.floor(Math.random() * colors.length)];
                        firework.style.boxShadow = `0 0 10px 2px ${colors[Math.floor(Math.random() * colors.length)]}`;
                        firework.style.zIndex = '5';
                        document.body.appendChild(firework);
                        
                        // Animate firework
                        const size = Math.random() * 20 + 10;
                        const particles = Math.floor(Math.random() * 10) + 10;
                        
                        // Explode
                        setTimeout(() => {
                            firework.style.transition = 'all 0.5s ease-out';
                            firework.style.transform = `scale(${size})`;
                            firework.style.opacity = '0';
                            
                            // Create particles
                            for (let p = 0; p < particles; p++) {
                                const particle = document.createElement('div');
                                particle.style.position = 'fixed';
                                particle.style.left = firework.style.left;
                                particle.style.top = firework.style.top;
                                particle.style.width = '3px';
                                particle.style.height = '3px';
                                particle.style.borderRadius = '50%';
                                particle.style.backgroundColor = colors[Math.floor(Math.random() * colors.length)];
                                particle.style.zIndex = '5';
                                document.body.appendChild(particle);
                                
                                // Animate particle
                                const angle = Math.random() * Math.PI * 2;
                                const distance = Math.random() * 100 + 50;
                                const duration = Math.random() * 1 + 0.5;
                                
                                setTimeout(() => {
                                    particle.style.transition = `all ${duration}s ease-out`;
                                    particle.style.transform = `translate(${Math.cos(angle) * distance}px, ${Math.sin(angle) * distance}px)`;
                                    particle.style.opacity = '0';
                                    
                                    setTimeout(() => {
                                        particle.remove();
                                    }, duration * 1000);
                                }, 10);
                            }
                            
                            setTimeout(() => {
                                firework.remove();
                            }, 500);
                        }, Math.random() * 500);
                    }, i * 300);
                }
            }
            
            // Easter egg - change background on icon click
            const icons = document.querySelectorAll('.friendship-icon');
            icons.forEach(icon => {
                icon.addEventListener('click', function() {
                    const bgColors = [
                        'linear-gradient(135deg, #ffcce6, #ccf2ff)',
                        'linear-gradient(135deg, #ffebcc, #ccffcc)',
                        'linear-gradient(135deg, #e6ccff, #ccffff)',
                        'linear-gradient(135deg, #ccffff, #ffe6cc)'
                    ];
                    
                    const randomBg = bgColors[Math.floor(Math.random() * bgColors.length)];
                    document.body.style.background = randomBg;
                    
                    // Bounce effect
                    icon.style.transform = 'scale(1.2)';
                    setTimeout(() => {
                        icon.style.transform = 'scale(1)';
                    }, 300);
                });
            });
        });
    </script>
</body>
</html>
