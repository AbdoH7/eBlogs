import React from 'react'
import '../signStyle.css'
import { useFormik } from "formik";
import * as Yup from "yup";

export default function Signin({changeForm}) {

    const formik = useFormik({
        initialValues: {
            email: "",
            password: "",
        },
        validationSchema: Yup.object({
            email: Yup.string()
                .required('Required!'),
            password: Yup.string()
                .required('Required!')
        }),
        onSubmit: () => {

            console.log("okay")
        }
    });
    return (
        <div className='sign'>
            <div>
                <div style={{height:"15px"}}></div>
                <h1>Welcome back</h1>
            </div>
            <div className='form-container'>

                <form action="" onSubmit={formik.handleSubmit}>
                    <input

                        name="email"
                        id="email"
                        type="email"
                        placeholder="Email Adress"
                        value={formik.values.email}
                        onChange={formik.handleChange}
                        onBlur={formik.handleBlur}

                    />
                    {formik.errors.email && formik.touched.email ? <p className="errorMsg">{formik.errors.email}</p> : null}

                    <input
                        name="password"
                        id="password"
                        type="password"
                        placeholder="Password"
                        value={formik.values.password}
                        onBlur={formik.handleBlur}
                        onChange={formik.handleChange}
                    />
                    {formik.errors.password && formik.touched.password ? <p className="errorMsg">{formik.errors.password}</p> : null}

                    <div className='submitBtnCnt'>
                      <button type="submit">Login </button>
                    </div>
                </form>
            </div>
            <div className='changeFormContainer'>
              <p className='changeForm'>Don't have an account? <p onClick={changeForm}>Signup</p></p>
            </div>
        </div>
    )
}
