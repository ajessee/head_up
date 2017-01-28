# Head Up, Inc.

https://headupinc.com/

This is a website that I built for a client who is starting a consulting company. Her basic requirements were a webpage where she could provide information to prospective clients about her business, capture lead information, and have clients sign up for a newsletter. 

In order to make sure that I shipped a product that she was happy with, we worked together using the agile methodology to ensure that she was involved in the design process from beginning to end. We set up a Trello board to track the user stories that we had built out together from her business requirements. She hired a designer to come up with a logo and color scheme, and I used those materials to create a visual design that reflected the vision she had for her business.

The site is written in Rails 5 and currently deployed in production using Amazon Web Services (AWS). 

## Features:

* Mobile-first design.
* Single page application with live scrolling between sections.
* HTML5 video splash page.
* Parallax scrolling.
* Lead capture form that populates database and sends email notification of new lead.
* Newsletter sign-up form that incorporates Mail Chimp to manage client communications.
* Links to social media sites and biography/credentials page.
* HTTPS secure connection to protect sensitive client/lead data.
* Secure user sign-in with administrative panel to manage leads and site users.
* User activation email upon user sign-up to ensure that user owns email address.
* Automatic password reset feature via email.

## Future features:

* Blog.
* Hosting of coaching materials, videos, audio.
* Stripe payment system integration to be able to sell materials to customers.
* Google calendar integration to be able to schedule coaching sessions with customers.


## Technical Specifications:

* Written in Rails 5.
* Hosted on AWS Elastic Compute Cloud (EC2) instance and deployed using Elastic Beanstalk.
* Setup to use Secure Shell (SSH) to connect securely to EC2 instance.
* Uses AWS Simple Email Service (SES) to deliver send user activation emails, password reset emails, or any other communication.
* Uses AWS an Lambda function to forward emails sent to any @headupinc.com email address to site owner and admin to enable two-way email communication through the site.
* Uses AWS Relational Database Service (RDS) and PostgresQL database for data persistence to store lead and client information.
* Uses AWS Simple Storage Service (S3) to store web application as well as incoming emails.
* Uses Bootstrap framework for front end design.



