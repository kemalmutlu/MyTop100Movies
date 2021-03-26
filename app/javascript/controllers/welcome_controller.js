import { Controller } from 'stimulus';
export default class extends Controller {
    static targets =['link']
    connect() {
        console.log("hello from StimulusJS")
    }

    open() {
        document.getElementById(this.linkTarget.id).style.display = 'block'
    }
    close() {
        document.getElementById(this.linkTarget.id).style.display = 'none'
    }
}