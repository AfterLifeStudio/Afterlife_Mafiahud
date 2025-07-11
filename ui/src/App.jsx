import { useState } from 'react'
import './App.css'
import Player from './components/player'
import Speedometer from './components/speedometer'
import { NuiEvent } from './hooks/NuiEvent';
import Fade from './utils/Fade';
function App() {
  const [visible, setVisible] = useState(false);
  NuiEvent("visible", (data) => setVisible(data));
  return (
    <>
    <Fade in={visible}>
    <Player />
    <Speedometer />
    </Fade>
    </>
  )
}

export default App
