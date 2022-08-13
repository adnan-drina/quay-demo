## Welcome to the Red Hat Quay Container Registry demo walkthrough page!

**This is not an official Red Hat product demo. For the official product resources, please see [Red Hat Quay](https://access.redhat.com/products/red-hat-quay)**

This Red Hat Quay Container Registry Developer walkthrough provides a simple guide for using the Quay when developing containerized applications. This walkthrough will not cover the Red Hat Quay Container Registry installation and configuration process. For more information on Quay installation, please see [Batteries-Included Quay Install on Red Hat OpenShift](https://www.youtube.com/watch?v=1_6jLGF5ByE)

For this demo, we'll assume that a pre-provisioned instance of Quay is available.

### Red Hat Quay: A private container registry for distributed, secure development

Red Hat Quay is a private container registry that stores, builds, and deploys container images. It analyzes your images for security vulnerabilities, identifying potential issues that can help you mitigate security risks. Additionally, it delivers georeplication and BitTorrent distribution to increase performance across distributed development sites and increase resiliency and redundancy for disaster recovery.

With Red Hat Quay, you can:

- Store your containers with added security. Red Hat Quay ensures your applications are stored privately, with powerful access and authentication settings you can control.
- Easily build and deploy new containers. Red Hat Quay automates your container builds with integration to GitHub, Bitbucket, and more. Robot accounts allow for automatic software deployments.
- Scan containers to provide security. Red Hat Quay scans your containers for vulnerabilities, giving you visibility into known issues and how to fix them.

In our walkthrough, we'll cover all key features of Quay used by developers when working with containers. We'll learn how to:

1. Build your first container image
2. Scan your container image for vulnerabilities
3. Mirror container images from external sources
4. Distribute your application using Helm
