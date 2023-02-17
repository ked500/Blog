// app/javascript/controllers/visibility_controller.js

import {Controller} from "@hotwired/stimulus"

export default class extends Controller {

    password(e) {
       this.show_password(e,"user_password");

    }

    password_confirmation(e) {
        this.show_password(e,"user_password_confirmation");

    }

    current_password(e) {
        this.show_password(e,"user_current_password");
    }

    show_password(e,elementID){
        let password_field = document.getElementById(`${elementID}`);
        let icon = e.currentTarget.closest("svg");

        this.change(icon, password_field);
    }

    change(icon, field) {
        if (field.type === "password") {
            icon.classList.remove('fa-eye');
            icon.classList.add('fa-eye-slash');
            field.type = "text";
        } else {
            icon.classList.remove('fa-eye-slash');
            icon.classList.add('fa-eye');
            field.type = "password";
        }
    }
}