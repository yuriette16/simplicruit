const displayApplication = () => {
  const btnEvaluation = document.querySelector(".btn-evaluation-form");
  const btnAnalysis = document.querySelector(".btn-video-analysis");
  const evaluationTab = document.querySelector(".evaluation-form-tab");
  const analysisTab = document.querySelector(".video-analysis-tab");
  if (btnEvaluation){
    btnEvaluation.addEventListener("click", (event) => {
      btnEvaluation.classList.add("active_button");
      btnAnalysis.classList.remove("active_button");
      evaluationTab.classList.remove("hidden");
      analysisTab.classList.add("hidden");
      });
    }
  if (btnAnalysis){
    btnAnalysis.addEventListener("click", (event) => {
      btnAnalysis.classList.add("active_button");
      btnEvaluation.classList.remove("active_button");
      analysisTab.classList.remove("hidden");
      evaluationTab.classList.add("hidden");
    });
  }
};

// const hideQuestionBtn = (event) => {
//   event.currentTarget.closest(".question-field").nextElementSibling.style.display = "none";
// };

const targetBtnEditQuestion = (btnEditQuestion) => {
  btnEditQuestion.addEventListener("click", (event) => {
    if (event.currentTarget.closest(".question-field").nextElementSibling.style.display == "block") {
      event.currentTarget.closest(".question-field").nextElementSibling.style.display = "none";
    } else if (event.currentTarget.closest(".question-field").nextElementSibling.style.display == "none") {
      event.currentTarget.closest(".question-field").nextElementSibling.style.display = "block";
      // setTimeout( hideQuestionBtn, 1500, event );
    }
  });
};

const displayEditQuestion = () => {
  const btnEditQuestions = document.querySelectorAll(".fa-bars");
  if (btnEditQuestions) {
    btnEditQuestions.forEach((btnEditQuestion) => {
      targetBtnEditQuestion(btnEditQuestion);
    });
  }
};


export { displayApplication, displayEditQuestion };
