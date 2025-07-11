import { useState,useEffect } from "react";
import { NuiEvent } from "../hooks/NuiEvent";
import Fade from "../utils/Fade";
import speedometerback from "../assets/speedometer.png"
import arrow from "../assets/arrow.png"
import fuelbar from "../assets/fuelbar.png"

const Speedometer = () => {

  const [data, setData] = useState({
    show:false,
    speed: 20,
    fuel: 40,
    distance: 100
  });
  NuiEvent("speedometer", (data) => setData(data));

  var angle = (data.speed / 360) * 280
  if (angle > 280){
    angle = 280
  }

  const mileage = Math.floor(data.distance).toString().padStart(6, "0")

  return (
    <Fade in={data.show}>
    <>
    <div  className="speedometer">
      <img className="speedometer-back" src={speedometerback} alt="" />

       <img className="fuelbar fuelback" src={fuelbar} alt="" />
      <img style={{clipPath: `polygon(0 0, ${data.fuel}% 0, ${data.fuel}% 100%, 0% 100%)`}} className="fuelbar" src={fuelbar} alt="" />
      <div className="distance-meter">{mileage}</div>
            <img style={{transform: `rotate(${angle}deg)`}} className="arrow" src={arrow} alt="" />
    </div>
    </>
    </ Fade>
  );
};

export default Speedometer;
