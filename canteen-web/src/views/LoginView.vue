<template>
    <div class="login-container">
        <div class="login-form-container">
            <form id="loginForm" @submit.prevent="handleSubmit" novalidate autocomplete="off">
                <h3>LOGIN</h3>
                <div v-if="errors.length" class="error-box">
                    <ul>
                        <li v-for="error in errors" :key="error">{{ error }}</li>
                    </ul>
                </div>

                <div class="form-group">
                    <input type="email" id="uEmail" name="uEmail" class="form-control" placeholder="enter your email" v-model="loginObj.email" />
                </div>

                <div class="form-group">
                    <input type="password" name="uPass" class="form-control" placeholder="enter your password" v-model="loginObj.pass" />
                </div>

                <div class="form-group">
                    <input type="submit" value="login now" class="button">
                    <p>don't have an account? <router-link @click.native="scrollToTop" to="/register">create one</router-link></p>
                </div>
            </form>
        </div>
    </div>
</template>

<script setup>
import { reactive, ref } from 'vue';

const loginObj = reactive({ email: "", pass: "" });
const errors = ref([]);

const scrollToTop = () => {
    window.scrollTo(0, 0);
};

const handleSubmit = () => {
    errors.value = [];

    if (!loginObj.email) {
        errors.value.push("Entering an email is required");
    } else {
        const emailPattern = /^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$/;
        if (!emailPattern.test(loginObj.email)) {
            errors.value.push('Email must be valid');
        }
    }

    if (!loginObj.pass) {
        errors.value.push('Password is required');
    }
};
</script>

<style scoped>
.login-container {
    padding: 2rem 9%;
}

.login-container .login-form-container {
    background-color: #fff;
    height: 70vh;
}

.login-container .login-form-container form {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    width: 30%;
    box-shadow: 0 1rem 1rem rgba(0, 0, 0, 0.05);
    border: 0.1rem solid rgba(0, 0, 0, 0.2);
    padding: 1rem;
    border-radius: .5rem;
    animation: fadeUp .4s linear;
}

.login-container .login-form-container form h3 {
    padding-bottom: 1rem;
    font-size: 1.5rem;
    font-weight: bolder;
    text-transform: uppercase;
    color: #130f40;
    margin: 0;
}

.login-container .login-form-container form .form-control {
    margin: .7rem 0;
    border-radius: .5rem;
    background: #f7f7f7;
    padding: 1rem;
    font-size: small;
    color: #130f40;
    text-transform: none;
    width: 100%;
    border: none;
}

.login-container .login-form-container form .button {
    margin-bottom: 1rem;
    margin-top: 1rem;
    width: 100%;
    font-size: small;
}

.login-container .login-form-container form p {
    padding-top: 1rem;
    font-size: small;
    color: #666;
    margin: 0;
}

.login-container .login-form-container form p a {
    color: #27ae60;
}

.login-container .login-form-container form p a:hover {
    color: #130f40;
    text-decoration: underline;
}

.login-container .login-form-container form .error-box {
    background-color: #fff9fa;
    box-sizing: border-box;
    border: 2px solid rgba(255, 66, 79, .2);
    border-radius: 2px;
    font-size: small;
    margin-bottom: 20px;
}

.login-container .login-form-container form .error-box ul {
    list-style-type: none;
    margin: 0;
    padding: 10px 0px;
}

.login-container .login-form-container form .error-box ul li {
    padding-left: 10px;
    color: rgb(182, 0, 0);
}
</style>
