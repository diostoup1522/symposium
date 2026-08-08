import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['input', 'area'];

  connect() {
    this.mq = window.matchMedia('(max-width: 350px)');
    this.mq.addEventListener('change', this.vpcheck);
    this.vpcheck(this.mq);
  }

  disconnect() {
    this.mq.removeEventListener('change', this.vpcheck);
  }

  vpcheck = (e) => {
    if (e.matches) {
      for (let input of this.inputTargets) {
        input.size = 25;
      }
      this.areaTarget.rows = 3;
      this.areaTarget.cols = 25;
    } else {
      for (let input of this.inputTargets) {
        input.size = 30; 
      }
      this.areaTarget.rows = 5;
      this.areaTarget.cols = 30;
    }
  }
}
