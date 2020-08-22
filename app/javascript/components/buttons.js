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

const hideQuestionBtn = (target) => {
  target.nextElementSibling.style.display = "none";
};

const targetBtnEditQuestion = (btnEditQuestion) => {
  btnEditQuestion.addEventListener("click", (event) => {
    if (event.currentTarget.closest(".question-field").nextElementSibling.style.display == "block") {
      event.currentTarget.closest(".question-field").nextElementSibling.style.display = "none";
    } else if (event.currentTarget.closest(".question-field").nextElementSibling.style.display == "none") {
      event.currentTarget.closest(".question-field").nextElementSibling.style.display = "block";
      const target = event.currentTarget.closest(".question-field");

      const hideQuestionBtnBinded = hideQuestionBtn.bind(null, target);
      // const hideQuestionBtnBinded = () = => {
      //   const hideQuestionBtn = (target) => {
      //     target.nextElementSibling.style.display = "none";
      //   };
      //   const target = event.currentTarget.closest(".question-field");
      //   return hideQuestionBtn(target);
      // }

      setTimeout( hideQuestionBtnBinded, 1000);
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


const changeQuestionMode = () => {
  const editQuestionMode = document.querySelector(".edit-question-mode");
  const inputQuestionMode = document.querySelector(".input-question-mode");
  const answerFields = document.querySelectorAll(".answer-field");
  const trashIcons = document.querySelectorAll(".a-trash-alt");
  const questionFields = document.querySelectorAll(".question-field");
  const trashicons = document.querySelectorAll(".trash-icon");
  const btnSaveEvaluation = document.querySelector('.btn-save-evaluation');
  if (editQuestionMode) {
    editQuestionMode.addEventListener("click", (event) => {
      answerFields.forEach((answerField) => {
        answerField.style.display = "none";
      });
      questionFields.forEach((questionField) => {
        questionField.classList.add("question-field");
      });
      trashicons.forEach((trashicon) => {
        trashicon.style.display = "block";
      });
    });
  };

  if (inputQuestionMode) {
    inputQuestionMode.addEventListener("click", (event) => {
      btnSaveEvaluation.style.display = "block";
      editQuestionMode.style.display = "none";
      answerFields.forEach((answerField) => {
        answerField.style.display = "block";
      });
      questionFields.forEach((questionField) => {
        questionField.classList.remove("question-field");
      });
      trashicons.forEach((trashicon) => {
        trashicon.style.display = "none";
      });
    });
  };

};



export { displayApplication, displayEditQuestion, changeQuestionMode };
