const scoreIndicator = () => {
var myConfig = {
  type: "gauge",
  globals: {
    fontSize: 24,
    backgroundColor:'#F4F4F4'
  },
  plotarea:{
    marginTop:80,
  },
  plot:{
    size:'100%',
    valueBox: {
      placement: 'center',
      text:'%v', //default
      fontSize:36,
      shadow:false,
      rules:[
        {
          rule: '%v >= 50',
          text: 'Pass'
        },
        {
          rule: '%v < 50',
          text: 'Fail'
        },
      ]
    }
  },
  scaleR:{
    aperture:180,
    minValue:0,
    maxValue:100,
    step:10,
    center:{
      visible:true
    },
    tick:{
      visible:false
    },
    item:{
      offsetR:0,
      rules:[
        {
          rule:'%i == 9',
          offsetX:10
        }
      ]
    },
    labels:['0','10','20','30','40','50','60','70','80','90','100'],
    ring:{
      size:10,
      rules:[
        {
          rule:'%v >= 50',
          backgroundColor:'#E53935'
        },
        {
          rule:'%v < 50',
          backgroundColor:'#29B6F6'
        }
      ]
    }
  },
refresh:{
      type:"feed",
      transport:"js",
      url:"feed()",
      interval:1500,
      resetTimeout:1000
  },
  series : [
    {
      values : [70], // starting value
      backgroundColor:'#0F4572',
      indicator:[10,10,10,10,0.80],
      animation:{
        effect:2,
        method:1,
        sequence:3,
        speed: 600
     },
    }
  ]
};

zingchart.render({
  id : 'myChart',
  data : myConfig,
  height: '300',
  width: '400'
});
}

export { scoreIndicator };
