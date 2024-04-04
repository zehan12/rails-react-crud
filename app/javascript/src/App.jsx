import React from "react";
import { Route, Routes, BrowserRouter as Router } from "react-router-dom";

const App = () => {
  return (
    <Router>
      <Routes>
        <Route path="/" element={<div>Home</div>} />
        <Route path="/about" element={<div>About</div>} />
      </Routes>
    </Router>
  );
};

export default App;
