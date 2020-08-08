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

export { displayApplication };
