import healthicon from "../assets/health.png";
import armouricon from "../assets/armour.png";
import hungericon from "../assets/hunger.png";
import thirsticon from "../assets/thirst.png";
import stressicon from "../assets/stress.png";
import micicon from "../assets/mic.png";
import { NuiEvent } from "../hooks/NuiEvent";
import Fade from "../utils/Fade";
import { useState } from "react";

const Player = () => {
  const [data, setData] = useState({
    show: false,
    health: 0,
    armour: 0,
    oxygen: 0,
    hunger: 0,
    thirst: 0,
    stress: 0,
    voice: false,
    voicemode: 1,
  });

    NuiEvent("player", (data) => setData(data));

  return (
    <>
      <Fade in={data.show}>
      <div  className="map">
        <div className="bar"></div>
        <div className="outline"></div>
      </div>
      </Fade>
      <div className="player-status">
        <div className="status health">
          <img src={healthicon} alt="" />
          <div>{data.health}</div>
        </div>
        <div className="status armour">
          <img src={armouricon} alt="" />
          <div>{data.armour}</div>
        </div>

        <div className="extrastatus">
          <div className="status extra">
            <img src={hungericon} alt="" />
            <div>{data.hunger}</div>
          </div>
          <div className="status extra">
            <img src={thirsticon} alt="" />
            <div>{data.thirst}</div>
          </div>
          <div className="status extra">
            <img src={stressicon} alt="" />
            <div>{data.stress}</div>
          </div>
        </div>

        <div className="status voice">
          <img style={{opacity: data.voice ? 1.0 : 0.5}} src={micicon} alt="" />
          <div style={{opacity: data.voice ? 1.0 : 0.5}} >{data.voicemode == 1 ? '30' : data.voicemode == 2 ? '60' : '100'}</div>
        </div>
      </div>
    </>
  );
};

export default Player;
