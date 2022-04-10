import { LightningElement, wire } from 'lwc';
import fetchSpeakersJS from '@salesforce/apex/MySpeakersController.fetchSpeakers';
import apexError from '@salesforce/apex/MySpeakersController.apexErrorMethod';
export default class LwcMySpeakers extends LightningElement {
    @wire(fetchSpeakersJS)
    speakers;

    @wire(apexError)
    speakersError;
}