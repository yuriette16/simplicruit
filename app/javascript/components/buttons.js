const displayApplication = () => {
  const btnEvaluation = document.querySelector(".btn-evaluation-form");
  const btnAnalysis = document.querySelector(".btn-video-analysis");
  const evaluationTab = document.querySelector(".evaluation-form-tab");
  const analysisTab = document.querySelector(".video-analysis-tab");
  if (btnEvaluation){
    btnEvaluation.addEventListener("click", (event) => {
      btnEvaluation.classList.add("active");
      btnAnalysis.classList.remove("active");
      evaluationTab.classList.remove("hidden");
      analysisTab.classList.add("hidden");
      });
    }
  if (btnAnalysis){
    btnAnalysis.addEventListener("click", (event) => {
      btnAnalysis.classList.add("active");
      btnEvaluation.classList.remove("active");
      analysisTab.classList.remove("hidden");
      evaluationTab.classList.add("hidden");
    });
  }
};


export { displayApplication };
