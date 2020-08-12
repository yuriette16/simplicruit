const GetPositionEdit = () => {
  const positionEdit = document.getElementById('select-position-edit');
  if(positionEdit){
   positionEdit.addEventListener("change", (event) => {
      window.location.href = window.location.protocol + "//" + window.location.host + "/" + 'positions/'+ positionEdit.value + '/skill_requirements/edit_all' ;
    });
  }
}

const GetPosition = () => {
 const position = document.getElementById('select-position');
  if(position){
   position.addEventListener("change", (event) => {
      window.location.href = window.location.protocol + "//" + window.location.host + "/" + 'positions/'+ position.value + '/skill_requirements' ;
    });
  }
}

export { GetPositionEdit };
export { GetPosition };



