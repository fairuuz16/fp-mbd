<template>
    <div class="register-container">
        <div class="register-form-container">
            <form id="registerForm" @submit.prevent="handleSubmit" novalidate autocomplete="off">
                <div id="app" class="container d-flex justify-content-center align-items-center">
                    <h3>Create your account</h3>
                </div>
                
                <div class="form-group">
                    <label for="uName">Username:
                    </label>
                    <input type="text" name="uName" placeholder="username" id="uName" class="form-control"
                        v-model="registerObj.name" />
                    <p class="error-mess" v-if="errorObj.nameErr.length > 0">{{ errorObj.nameErr[0] }}</p>
                </div>

                <div class="form-group">
                    <label for="uEmail">E-mail:
                    </label>
                    <input type="email" name="uEmail" placeholder="example@gmail.com" id="uEmail" class="form-control"
                        v-model="registerObj.email" />
                    <p class="error-mess" v-if="errorObj.emailErr.length > 0">{{ errorObj.emailErr[0] }}</p>
                </div>

                <div class="form-group">
                    <label for="uPass">Password:
                    </label>
                    <input type="password" name="uPass" placeholder="enter your password" id="uPass"
                        class="form-control" v-model="registerObj.pass" />
                    <p class="error-mess" v-if="errorObj.passErr.length > 0">{{ errorObj.passErr[0] }}</p>
                </div>

                <div class="form-group">
                    <label for="uPassConfirm">Confirm Password:
                    </label>
                    <input type="password" name="uPassConfirm" placeholder="enter your password again" id="uPassConfirm"
                        class="form-control" v-model="registerObj.confirm" />
                    <p class="error-mess" v-if="errorObj.confirmErr.length > 0">{{ errorObj.confirmErr[0] }}</p>
                </div>

                <div class="form-group">
                    <input type="submit" value="Register" class="button" />
                    <p>have an account? <router-link @click.native="scrollToTop" to="/login">login</router-link>
                    </p>
                </div>
            </form>
        </div>
    </div>
</template>

<script>
export default {
    name: "Register",

    data() {
        return {
            registerObj: { name: "", email: "", pass: "", confirm: ""},
            errorObj: { nameErr: [], emailErr: [], passErr: [], confirmErr:""},
            matchUser: undefined,
        }
    },

    methods: {
        scrollToTop() {
            window.scrollTo(0, 0);
        },

        availableTime() {
            const now = new Date();
            const day = ("0" + now.getDate()).slice(-2);
            const currentMonth = ("0" + (now.getMonth() + 1)).slice(-2);
            const minRange = (now.getFullYear() - 150) + "-" + currentMonth + "-" + day;
            const maxRange = now.getFullYear() + "-" + currentMonth + "-" + day;

            document.getElementById("uBirth").setAttribute("min", minRange);
            document.getElementById("uBirth").setAttribute("max", maxRange);
        },

        async handleSubmit() {
            this.resetCheckErr();
            this.checkForm();

            if (!this.checkEmptyErr()) return;

            await this.getMatchUser(this.registerObj.email);

            if (this.matchUser) {
                this.errorObj.emailErr.push("Account already exists");
            } else {
                const data = {
                    user_name: this.registerObj.name,
                    user_email: this.registerObj.email,
                    user_password: this.registerObj.pass
                };
                await axios.post("/users/", data);
                this.$router.push("/login");
            }
        },

        async getMatchUser(email) {
            const response = await axios.get('/users/' + email);
            this.matchUser = response.data;
        },

        resetCheckErr() {
            this.errorObj = { nameErr: [], emailErr: [], passErr: []};
        },

        checkEmptyErr() {
            return Object.values(this.errorObj).every(errArray => errArray.length === 0);
        },

        checkForm() {
            if (!this.registerObj.name) {
                this.errorObj.nameErr.push("Entering a name is required");
            } else if (!/^[A-Za-z]+$/.test(this.registerObj.name.replace(/\s/g, ""))) {
                this.errorObj.nameErr.push('A name can only contain letters');
            }

            // Email validation
            if (!this.registerObj.email) {
                this.errorObj.emailErr.push("Entering an email is required");
            } else if (!/[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$/.test(this.registerObj.email)) {
                this.errorObj.emailErr.push('Email must be valid');
            }

            // Password validation
            if (!this.registerObj.pass) {
                this.errorObj.passErr.push('Password is required');
            } else {
                if (this.registerObj.pass.length < 8) {
                    this.errorObj.passErr.push('Password must be more than or equal 8 characters');
                }
            }

        }
    },
};
</script>

<style scoped>

</style>
