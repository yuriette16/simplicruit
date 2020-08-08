const sendSaveQuestionnaireRequest = () => {
  const answerAreas = document.querySelectorAll(".answer-field");
  answerAreas.forEach((answerArea) => {
    const questionnaireId = answerArea.dataset.questionnaire;
    const questionId = answerArea.dataset.question;
    const jobApplication = answerArea.dataset.job_application;
    const answerString = answerArea.innerText;

    const url = "/job_applications/" + jobApplication + "/questionnaires/" + questionnaireId + "?question_id=" + questionId + "&answer=" + answerString
    fetch(url, {
      method: "PATCH",
      headers: {
        'X-CSRF-Token': $("meta[name='csrf-token']").attr("content")
      }
      // body: JSON.stringify({ "question_id": questionId, "answer": answerString })
    })
    .then((data) => {
      console.log(data);
    });
  });
};

// fetch("/reservations/" + reservationId + "?status=reject", {

const saveQuestionnaire = () => {
  const saveQuestionnaire = document.querySelector(".btn-save-evaluation");
  if (saveQuestionnaire) {
    saveQuestionnaire.addEventListener("click", (event) => {
      sendSaveQuestionnaireRequest();
    });
  }
};

export { saveQuestionnaire };
