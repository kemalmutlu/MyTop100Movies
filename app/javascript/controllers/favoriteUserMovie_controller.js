import { Controller } from "stimulus"
import axios from "axios";

const starIcon = '<i class="fa fa-star fav-star" aria-hidden="true"></i>';

export default class extends Controller {
    static targets = [ "movie"]

    connect(){
        axios.get(user_movie_present_url).then((response) => {
            if(response.data.status == 'present'){
                this.movieTarget.innerHTML = `${starIcon} Remove your list`
                this.movieTarget.setAttribute("class","btn btn-success text-black");
            }else{
                this.movieTarget.innerHTML = `${starIcon} Add your list`
                this.movieTarget.setAttribute("class","btn btn-warning text-black");
            }
        }).catch(error => console.log(error))
    }

    check() {
        let movie = this.movieTarget.dataset.movieId;
        const token = document.querySelector('[name=csrf-token]').content
        axios.defaults.headers.common['X-CSRF-TOKEN'] = token

        axios.post(favorite_movie_url, {movie}).then((response) => {
            if(response.data.status == 'added'){
                this.movieTarget.innerHTML = `${starIcon} Remove your list`
                this.movieTarget.setAttribute("class","btn btn-success text-black");
            }else{
                this.movieTarget.innerHTML = `${starIcon} Add your list`
                this.movieTarget.setAttribute("class","btn btn-warning text-black");
            }
        }).catch(error => console.log(error))
    }
}