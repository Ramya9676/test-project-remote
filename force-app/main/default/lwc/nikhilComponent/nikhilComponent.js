import { LightningElement, track } from 'lwc';

export default class Counter extends LightningElement {
    @track count = 0; // Holds the current count value

    // Method to increase the count
    increaseCount() {
        this.count += 1;
    }

    // Method to decrease the count
    decreaseCount() {
        if (this.count > 0) {
            this.count -= 1;
        }
    }

    // Method to reset the count
    resetCount() {
        this.count = 0;
    }
}