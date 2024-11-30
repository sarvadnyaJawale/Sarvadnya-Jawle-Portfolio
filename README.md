# Sarvadnya Jawle |♾️

<p align="center"> <a href="https://sarvadnya.tech"> <img src="https://github.com/sarvadnyaJawale/Sarvadnya-Jawle-Portfolio/blob/main/assets/favicon.png" width="70" alt="Portfolio's favicon"> </a> </p> <p align="center"> <span style="font-size: larger;">sarvadnya.tech | DevOps Portfolio</span> </p> <div align="center"> <img src="https://img.shields.io/badge/AWS-%23FF9900.svg?style=for-the-badge&logo=amazon-aws&logoColor=white" alt="AWS badge"> <img src="https://img.shields.io/badge/Terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white" alt="Terraform badge"> <img src="https://img.shields.io/badge/Kubernetes-%23326CE5.svg?style=for-the-badge&logo=kubernetes&logoColor=white" alt="Kubernetes badge"> <img src="https://img.shields.io/badge/Docker-%232496ED.svg?style=for-the-badge&logo=docker&logoColor=white" alt="Docker badge"> </div>

Table of Contents
-----------------
* [🚪 Introduction](#-introduction)
* [💾 Content](#-content)
* [🔮 Features](#-features)
  * [🌒 Day'n'Nite](#-daynnite)
  * [📬 EmailJS](#-emailjs)
  * [📜 Single page](#-single-page)
  * [🖼️ Swiper](#-swiper)


---

# 🚪 Introduction

Looking for a job should indeed be considered a job in itself. Regardless of how pessimistic the previous statement might sound, I've never experienced something as depressing, draining, and exhausting as trying to find _something_, whatever it is, wherever it is.

Certificates. Trainings. Degrees. We have a huge vested interest in them, partly because it's education that's meant to take us into this future that we can't grasp. I am not denying the inherent truth of it, though; a solid education is a pretty easy thing to carry around, yet our approach to education requires a deep reform. Similarly, the lack of educational and professional opportunities should be discussed and addressed, but that's a story for another night. Today, we'll focus on the importance of portfolios, which may significantly define our success while trying to find an opportunity.

![Sarvadnya jawle | Portfolio](https://github.com/user-attachments/assets/4bd17909-26a7-40e7-94e6-a352f539ef7d)

---

# 💾 Content

| Section                  | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
|--------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **About**                | ℹ️ _Who is Sarvadnya Jawle?_ This section provides a **brief introduction** to Sarvadnya, a DevOps professional and final-year IT student, along with links to key professional platforms, such as [LinkedIn](https://www.linkedin.com/in/sarvadnya-jawle/) where he shares his expertise on DevOps and Kubernetes. You'll also find access to his [GitHub](https://github.com/your-github) showcasing projects like AWS Two-Tier Architecture and Dockerized applications. |
| **Skills**               | 🛠️ **Technical expertise**, including skills in **AWS**, **Docker**, **Kubernetes**, **Terraform**, **Ansible**, and more. Skills are organized into categories for easy navigation using an **accordion format** to keep the information concise and accessible.                                                                                                                                                                                       |
| **Experience**           | 💼 This section showcases Sarvadnya's **educational background** and **professional experience** as a DevOps Engineer at Global Mobility Services. It highlights key achievements like cost optimizations, CI/CD pipeline improvements, and infrastructure automation using Terraform. Experience is displayed on a **visual timeline**, making it easy for recruiters to trace his career journey and accomplishments.                                           |
| **Projects**             | 🚀 Sarvadnya's **projects** demonstrate his hands-on expertise, including setting up a VPC with Terraform, deploying a Netflix clone on EKS, and developing a data visualization dashboard using the MERN stack. Each project is detailed with descriptions, source code links, and key learnings to give a comprehensive view of his work.                                                                                                                        |
| **Kubernetes Manifests** | 📜 For those interested in Kubernetes, Sarvadnya shares **manifests** for deploying applications, including deployment configurations, services, ingresses, ConfigMaps, and secrets, all hosted in the `/k8s-manifests` directory. This section provides real-world examples of how Sarvadnya configures and manages Kubernetes resources.                                                                                                                        |
| **Automation Scripts**   | 🤖 **Scripts** for automating deployments and cleanup processes can be found in the `/scripts` directory. These scripts demonstrate Sarvadnya's proficiency in streamlining workflows and managing infrastructure as code, reinforcing his DevOps capabilities.                                                                                                                                                                                               |
| **Contact**              | ☎️ Reach out to Sarvadnya through his **contact form**, with fields for name, email, and message. For more direct communication, professional contact information like email and LinkedIn are also provided, ensuring that getting in touch is straightforward and efficient.                                                                                                                                                |

---

# 🔮 Features

Similarly to many other examples that have become extremely popular these days, I decided to organize this portfolio following the structure of a **landing page** - and believe me when I say that back in the day, landing pages triggered some of my worst nightmares as someone just getting started!

Those, however, were extremely simple yet not functional at all. Beautiful? Yes. A blank page? Yes, again. That's definitely not the case occupying us today, though.

## 🌒 Day'n'Nite

Just as it's mandatory these days, I incorporated a **theme switcher** to enhance the visual appeal for readers and nocturnal creatures of the interwebz, which will hopefully allow users to personalize their viewing experience based on their preferences.

![Light-Mode](https://github.com/user-attachments/assets/8e3f48eb-828b-469f-84dc-564fc752ad46)

![Dark-Mode](https://github.com/user-attachments/assets/5b8d53cf-2e9c-4dfb-8c9d-1a4a7075bf91)


## 📬 EmailJS

What makes ![image](https://github.com/user-attachments/assets/a11e86aa-b578-4635-b29f-aecc801475a7)
 great is the fact that it keeps things simple. This beautiful tool helps to send emails using client-side technologies only. No server is required – just connect EmailJS to one of the supported email services, create an email template, and use one of their SDK libraries to trigger an email. Boom! That's it!

In case you are curious about the implementation itself, don't hesitate to inspect the [main.js file](/js/main.js):

```javascript
/* Mail integration */
document.addEventListener("DOMContentLoaded", function() {
  emailjs.init("YOUR_USER_ID")
})

document.getElementById('contact-form').addEventListener('submit', function(event) {
  event.preventDefault()

  emailjs.sendForm('YOUR_SERVICE_ID', 'YOUR_TEMPLATE_ID', this)
    .then(function(response) {
      console.log('Success!', response.status, response.text)
      alert('Email sent successfully!')
      document.getElementById('contact-form').reset()
    }, function(error) {
      console.log('Failed...', error)
      alert('Email sending failed.')
    })
})
```

> [!NOTE]
> Needless to say, the [original documentation](https://www.emailjs.com/docs/) is worth your time, guys - but as you can see, integrating EmailJS into your project couldn't be easier!

## 📜 Single page

Truth said, one of the factors allowing me to realize that I'm indeed _evolving into the Lola Flores of the coding sector_ is that now, I can tell when I should (or shouldn't) overcomplicate my life. As programmers, our main goal is solving problems - and not all issues require the same tools, not even intricate ones.

In this case, the idea I had in mind was simple: a clean, minimalist, compact portfolio allowing users to get a clear insight into who Maria _is_ as a professional. That's why, independently of my toxic relationship with React, NextJS, or Astro, I chose my best warriors: the tools that started it all. My coding roots, so to speak.

## 🖼️ Swiper

Swiper is considered one of the most modern free and open-source mobile touch slider with hardware-accelerated transitions - websites, web apps, and mobile native/hybrid apps are no exception!

---
