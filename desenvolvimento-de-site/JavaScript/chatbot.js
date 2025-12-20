const feaSimulation = {
    "Hi": "Hi there! How can I help you about FEA and FEM today?",
    "What is FEM?": {
        answer: "FEM stands for Finite Element Method. It is a numerical technique used to solve complex engineering and mathematical problems by dividing a large system into smaller, simpler parts called finite elements. These elements are then analyzed individually and combined to approximate the behavior of the entire system.",
        followUp: [
            "What are the key concepts in FEM?",
            "What is the theory behind FEM?",
            "What are the applications of FEM?"
        ]
    },
    "What is FEA?": {
        answer: "FEA stands for Finite Element Analysis. It is the application of the Finite Element Method (FEM) to simulate and predict how structures and systems behave under various physical conditions, such as stress, heat, vibration, and fluid flow.",
        followUp: [
            "What are the types of FEA?",
            "What are the challenges of FEA?",
            "What are the future trends in FEA?"
        ]
    },
    "What is the theory behind FEM?": {
        answer: "The theory behind FEM is based on the idea of discretization. A complex system is divided into smaller, interconnected elements, and the governing equations (e.g., differential equations) are solved for each element. The solutions are then combined to approximate the behavior of the entire system. FEM relies on principles from calculus, linear algebra, and physics.",
        followUp: [
            "What are the key concepts in FEM?",
            "What are the applications of FEM?",
            "What are the challenges of FEM?"
        ]
    },
    "What are the key concepts in FEM?": {
        answer: [
            "1. **Discretization**: Breaking down a complex system into smaller finite elements.",
            "2. **Mesh**: The collection of finite elements that represent the system.",
            "3. **Nodes**: Points where elements are connected, used to calculate displacements, stresses, etc.",
            "4. **Shape Functions**: Mathematical functions that describe how quantities (e.g., displacement) vary within an element.",
            "5. **Boundary Conditions**: Constraints applied to the system to simulate real-world conditions.",
            "6. **Material Properties**: Defines how materials behave under stress, heat, etc."
        ],
        followUp: [
            "Tell me more about Discretization",
            "Tell me more about Mesh",
            "Tell me more about Nodes",
            "Tell me more about Shape Functions",
            "Tell me more about Boundary Conditions",
            "Tell me more about Material Properties"
        ]
    },
    "Tell me more about Discretization": {
        answer: [
            "Discretization is the process of dividing a complex system into smaller, simpler parts called finite elements.",
            "**Why is it important?**: It allows us to approximate the behavior of complex systems using simpler mathematical models.",
            "**Types of Elements**: Common element types include 1D (bars), 2D (triangles, quadrilaterals), and 3D (tetrahedrons, hexahedrons).",
            "**Challenges**: Choosing the right element size and type is critical for accurate results."
        ],
        followUp: [
            "What are the different types of finite elements?",
            "How do you choose the right element size for a simulation?"
        ]
    },
    "Tell me more about Mesh": {
        answer: [
            "A mesh is a collection of finite elements that represent the geometry of the system being analyzed.",
            "**Types of Meshes**: Structured (regular patterns) and unstructured (irregular patterns).",
            "**Mesh Quality**: A good mesh has well-shaped elements with minimal distortion.",
            "**Mesh Refinement**: Increasing the number of elements in critical areas for higher accuracy."
        ],
        followUp: [
            "What is the difference between structured and unstructured meshes?",
            "How do you improve mesh quality?"
        ]
    },
    "Tell me more about Nodes": {
        answer: [
            "Nodes are points where finite elements are connected. They are used to calculate displacements, stresses, and other quantities.",
            "**Role in FEM**: Nodes store the degrees of freedom (e.g., displacement, temperature) of the system.",
            "**Node Density**: Higher node density in critical areas improves accuracy but increases computational cost."
        ],
        followUp: [
            "What are degrees of freedom in FEM?",
            "How do nodes affect the accuracy of a simulation?"
        ]
    },
    "Tell me more about Shape Functions": {
        answer: [
            "Shape functions are mathematical functions that describe how quantities (e.g., displacement, temperature) vary within an element.",
            "**Purpose**: They interpolate values between nodes to approximate the behavior of the element.",
            "**Types**: Linear, quadratic, and higher-order shape functions.",
            "**Importance**: Higher-order shape functions improve accuracy but require more computational resources."
        ],
        followUp: [
            "What is the difference between linear and quadratic shape functions?",
            "How do shape functions affect the accuracy of a simulation?"
        ]
    },
    "Tell me more about Boundary Conditions": {
        answer: [
            "Boundary conditions are constraints applied to a system to simulate real-world conditions.",
            "**Types**:",
            "- **Dirichlet Boundary Conditions**: Specify the value of a variable (e.g., fixed displacement).",
            "- **Neumann Boundary Conditions**: Specify the gradient of a variable (e.g., applied force).",
            "**Importance**: They define how the system interacts with its environment."
        ],
        followUp: [
            "What is the difference between Dirichlet and Neumann boundary conditions?",
            "How do boundary conditions affect the results of a simulation?"
        ]
    },
    "Tell me more about Material Properties": {
        answer: [
            "Material properties define how materials behave under stress, heat, and other physical conditions.",
            "**Key Properties**:",
            "- **Elasticity**: How a material deforms under stress.",
            "- **Plasticity**: Permanent deformation after yielding.",
            "- **Thermal Conductivity**: How well a material conducts heat.",
            "**Importance**: Accurate material properties are essential for reliable simulations."
        ],
        followUp: [
            "What is the difference between elastic and plastic deformation?",
            "How do material properties affect the accuracy of a simulation?"
        ]
    },
    "What is the history of FEM?": {
        answer: [
            "1940s: Richard Courant introduces the concept of dividing a domain into finite elements.",
            "1950s: Engineers like Ray Clough and Olgierd Zienkiewicz formalize FEM for structural analysis.",
            "1960s: NASA develops NASTRAN, the first commercial FEA software, for aerospace applications.",
            "1970s-1980s: FEM expands into civil, mechanical, and automotive engineering.",
            "1990s-present: FEM becomes widely accessible with user-friendly software like ANSYS, Abaqus, and COMSOL."
        ],
        followUp: [
            "What are some curiosities about FEM?",
            "What are the applications of FEM?"
        ]
    },
    "What are some curiosities about FEM?": {
        answer: [
            "1. FEM can simulate phenomena at scales ranging from nanometers (e.g., microchips) to kilometers (e.g., bridges).",
            "2. The Apollo space program used early FEM techniques to ensure the structural integrity of spacecraft.",
            "3. FEM is used in the design of roller coasters to optimize safety and thrill.",
            "4. Modern FEM software can simulate multiphysics problems, such as fluid-structure interaction.",
            "5. FEM can predict the behavior of materials and structures under extreme conditions, such as earthquakes or explosions."
        ],
        followUp: [
            "What is the history of FEM?",
            "What are the applications of FEM?"
        ]
    },
    "What are the applications of FEM?": {
        answer: [
            "1. **Aerospace**: Designing aircraft wings, fuselages, and spacecraft components.",
            "2. **Automotive**: Crash testing, durability analysis, and lightweight vehicle design.",
            "3. **Civil Engineering**: Designing bridges, skyscrapers, and dams to withstand environmental loads.",
            "4. **Biomedical**: Designing prosthetics, studying bone mechanics, and simulating blood flow.",
            "5. **Electronics**: Predicting thermal management and electromagnetic interference in devices.",
            "6. **Energy**: Designing wind turbines, nuclear reactors, and oil rigs.",
            "7. **Manufacturing**: Optimizing machining processes and tooling to reduce defects."
        ],
        followUp: [
            "What are the types of FEA?",
            "What are the challenges of FEM?"
        ]
    },
    "What are the types of FEA?": {
        answer: [
            "1. **Static Analysis**: Studies the effects of steady loads on a structure.",
            "2. **Dynamic Analysis**: Examines how structures respond to time-varying loads, such as vibrations or impacts.",
            "3. **Thermal Analysis**: Predicts temperature distribution and heat transfer.",
            "4. **Fluid Flow Analysis**: Simulates fluid behavior using Computational Fluid Dynamics (CFD).",
            "5. **Nonlinear Analysis**: Accounts for material plasticity, large deformations, or contact problems."
        ],
        followUp: [
            "What are the challenges of FEA?",
            "What are the future trends in FEA?"
        ]
    },
    "What are the challenges of FEM?": {
        answer: [
            "1. **Mesh Quality**: Poorly designed meshes can lead to inaccurate results.",
            "2. **Computational Cost**: High-fidelity simulations require significant computational resources.",
            "3. **Material Modeling**: Accurately representing complex material behavior can be difficult.",
            "4. **Validation**: Simulation results must be validated with experimental data to ensure accuracy."
        ],
        followUp: [
            "What are the future trends in FEM?",
            "What are the applications of FEM?"
        ]
    },
    "What are the future trends in FEM?": {
        answer: [
            "1. **AI and Machine Learning**: Automating mesh generation, optimizing designs, and reducing computational time.",
            "2. **Cloud Computing**: Enabling complex simulations without high-end local hardware.",
            "3. **Multiphysics Simulations**: Integrating multiple physical phenomena into a single simulation.",
            "4. **Real-Time FEA**: Enabling real-time simulations for virtual prototyping and digital twins.",
            "5. **Sustainability**: Designing eco-friendly structures and optimizing energy consumption."
        ],
        followUp: [
            "What are the challenges of FEM?",
            "What are the applications of FEM?"
        ]
    },
    "What are the advantages of FEM?": {
        answer: [
            "1. **Versatility**: FEM can be applied to a wide range of problems, from structural analysis to fluid dynamics.",
            "2. **Accuracy**: With proper mesh refinement and modeling, FEM provides highly accurate results.",
            "3. **Cost-Effective**: Reduces the need for physical prototypes, saving time and money.",
            "4. **Insight**: Provides detailed insights into the behavior of complex systems under various conditions.",
            "5. **Optimization**: Enables engineers to optimize designs for performance, safety, and efficiency."
        ],
        followUp: [
            "What are the challenges of FEM?",
            "What are the applications of FEM?"
        ]
    },
    "What are the limitations of FEM?": {
        answer: [
            "1. **Computational Cost**: High-fidelity simulations can be computationally expensive.",
            "2. **Mesh Dependency**: Results can be highly dependent on the quality of the mesh.",
            "3. **Material Modeling**: Accurately modeling complex material behavior can be challenging.",
            "4. **Validation**: Simulation results must be validated with experimental data, which can be time-consuming.",
            "5. **User Expertise**: Requires skilled users to set up and interpret simulations correctly."
        ],
        followUp: [
            "What are the challenges of FEM?",
            "What are the future trends in FEM?"
        ]
    },
    "What software is used for FEA?": {
        answer: [
            "1. **ANSYS**: A widely used FEA software for structural, thermal, and fluid simulations.",
            "2. **Abaqus**: Known for its advanced capabilities in nonlinear and multiphysics simulations.",
            "3. **COMSOL Multiphysics**: Specializes in multiphysics simulations, including coupled phenomena.",
            "4. **NASTRAN**: One of the earliest FEA software, still used in aerospace and automotive industries.",
            "5. **SolidWorks Simulation**: Integrated with CAD software for easy design and analysis.",
            "6. **LS-DYNA**: Popular for dynamic and impact simulations."
        ],
        followUp: [
            "What are the types of FEA?",
            "What are the challenges of FEA?"
        ]
    },
    "Conclusion": {
        answer: "FEM and FEA are powerful tools that have revolutionized engineering and scientific simulations. From aerospace to biomedical applications, FEM enables engineers to predict and optimize the behavior of complex systems. As technology advances, FEM will continue to evolve, making it an indispensable tool for innovation.",
        followUp: [
            "What are the future trends in FEM?",
            "What are the applications of FEM?"
        ]
    }
    

};

// Minimize/Expand Chatbot
const chatbotContainer = document.querySelector('.chatbot-container');
const minimizeBtn = document.getElementById('minimize-btn');

minimizeBtn.addEventListener('click', (e) => {
    e.stopPropagation(); // Prevent the header click event from firing
    chatbotContainer.classList.toggle('minimized');
});

// Toggle minimize/expand when clicking the header
const chatbotHeader = document.querySelector('.chatbot-header');
chatbotHeader.addEventListener('click', () => {
    chatbotContainer.classList.remove('minimized');
});

// Function to get answers based on user questions
function getAnswer(question) {
    const response = feaSimulation[question];
    if (response) {
        if (Array.isArray(response.answer)) {
            return { answer: response.answer.join("\n"), followUp: response.followUp };
        } else {
            return { answer: response.answer, followUp: response.followUp };
        }
    } else {
        return { answer: "Sorry, I don't have an answer for that question. Please try another one!", followUp: [] };
    }
}

// Function to add a message to the chat
function addMessageToChat(message, isUser) {
    const chatMessages = document.querySelector('.chatbot-messages');
    const messageElement = document.createElement('div');
    messageElement.classList.add('message');
    messageElement.classList.add(isUser ? 'user-message' : 'bot-message');
    messageElement.textContent = message;
    chatMessages.appendChild(messageElement);

    // Scroll to the bottom of the chat
    chatMessages.scrollTop = chatMessages.scrollHeight;
}

// Function to handle user input
function handleUserInput() {
    const chatInput = document.querySelector('.chatbot-input');
    const userMessage = chatInput.value.trim();

    if (userMessage) {
        // Add user's message to the chat
        addMessageToChat(userMessage, true);

        // Get the bot's response
        const botResponse = getAnswer(userMessage);
        addMessageToChat(botResponse.answer, false);

        // Clear the input field
        chatInput.value = '';

        // Display follow-up questions (optional)
        if (botResponse.followUp.length > 0) {
            const followUpMessage = "Follow-up questions:\n" + botResponse.followUp.join("\n");
            addMessageToChat(followUpMessage, false);
        }
    }
}

// Add event listeners
document.addEventListener('DOMContentLoaded', () => {
    const sendButton = document.querySelector('.chatbot-send-button');
    const chatInput = document.querySelector('.chatbot-input');

    // Send message when the button is clicked
    sendButton.addEventListener('click', handleUserInput);

    // Send message when Enter key is pressed
    chatInput.addEventListener('keypress', (e) => {
        if (e.key === 'Enter') {
            handleUserInput();
        }
    });

    // Display the initial bot message
    addMessageToChat("Hi there! How can I help you about FEA and FEM today?", false);
});