import React from "react";
import axios from "axios";
import { useEffect, useState } from "react";
import { CMS_BASE_URL, SLOGAN_ENDPOINT, HEADINGS_ENDPOINT } from "../../APIs";
import "./landingPageStyle.css";
import Signup from "./sign/signup/signup";
import Signin from "./sign/signin/signin";

export default function LandingPage() {
  const [slogan, setSlogan] = useState({});
  const [headings, setHeadings] = useState([]);
  const [showSignup, setShowSignup] = useState(true)
  useEffect(() => {
    axios
      .get(CMS_BASE_URL + SLOGAN_ENDPOINT)
      .then((res) => {
        setSlogan(res.data.data.attributes);
        console.log(res.data.data);
      })
      .catch((e) => {
        console.log(e);
      });
    axios
      .get(CMS_BASE_URL + HEADINGS_ENDPOINT)
      .then((res) => {
        setHeadings(res.data.data);
        console.log("Request2");
      })
      .catch((e) => {
        console.log(e);
      });
  }, []);

  const changeForm = () => {
    setShowSignup((prevState) => !prevState)
  };

  return (
    <div>
      <div className="slogan">
        <div className="headerElements">
          <h1>{slogan.slogan}</h1>
          <h4>{slogan.content}</h4>
        </div>
      </div>
      <div className="flex-container">
        <div className="headings">
          {headings.map(({ attributes: { Title, content } }) => (
            <>
              <h2>{Title}</h2>
              <div>{content}</div>
            </>
          ))}
        </div>
        <div className="signCnt">
          {showSignup? <Signup changeForm={changeForm}/> : <Signin changeForm={changeForm}/>}
        </div>
      </div>
    </div>
  );
}
