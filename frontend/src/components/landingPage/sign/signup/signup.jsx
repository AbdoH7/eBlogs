import React from 'react'
import '../signStyle.css'
import { useFormik } from "formik";
import * as Yup from "yup";

export default function Signup({changeForm}) {

    const formik = useFormik({
        initialValues: {
            firstName: "",
            lastName: "",
            email: "",
            password: "",
            userName:"",
        },
        validationSchema: Yup.object({
            firstName: Yup.string()
                .required('Required!'),
            lastName: Yup.string()
                .required('Required!'),
            email: Yup.string()
                .email('invalid Email Adress')
                .required('Required!'),
            userName: Yup.string()
                .required('Required!'),
            password: Yup.string()
                .required('Required!')
                .min(8, 'should be 8 chars minimum.')
                .matches(/[a-zA-Z]/, 'Password can only contain Latin letters.'),
        }),
        onSubmit: () => {

            console.log("okay")
        }
    });
    return (
        <div className='sign'>
            <div>
                <div style={{height:"15px"}}></div>
                <h1>Join us now</h1>
                <h6>Start sharing your mind freely to the world<br/>and express your thoughts</h6>
            </div>
            <div className='form-container'>

                <form action="" onSubmit={formik.handleSubmit}>
                    {/* <button type="button" className="closeBtn">X</button> */}
                    <input
                        name="firstName"
                        id="first-name"
                        type="text"
                        placeholder="First Name"
                        value={formik.values.firstName}
                        onChange={formik.handleChange}
                        onBlur={formik.handleBlur}
                    />
                    {formik.errors.firstName && formik.touched.firstName ? <p className="errorMsg">{formik.errors.firstName}</p> : null}

                    <input
                        name="lastName"
                        id="last-name"
                        type="text"
                        placeholder="Last Name"
                        value={formik.values.lastName}
                        onChange={formik.handleChange}
                        onBlur={formik.handleBlur}
                    />
                    {formik.errors.lastName && formik.touched.lastName ? <p className="errorMsg">{formik.errors.lastName}</p> : null}

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
                        name="username"
                        id="username"
                        type="text"
                        placeholder="Username"
                        value={formik.values.username}
                        onChange={formik.handleChange}
                        onBlur={formik.handleBlur}
                    />
                    {formik.errors.username && formik.touched.username ? <p className="errorMsg">{formik.errors.username}</p> : null}

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
                        <button className="newAcc" type="submit">Create New Account </button>
                    </div>
                </form>
            </div>
            <div className='changeFormContainer'>
                <p className='changeForm'>Already have an account? <p onClick={changeForm}>login</p></p>
            </div>
        </div>
    )
}
