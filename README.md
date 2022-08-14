## Red Hat Quay Container Registry demo walkthrough

**This is not an official Red Hat product demo. For the official product resources, please see [Red Hat Quay](https://access.redhat.com/products/red-hat-quay)**

This developer-focused walkthrough provides a simple guide for using the Red Hat Quay Container Registry when working with containerized applications. The walkthrough will not cover the Red Hat Quay installation and configuration process. For more information on Red Hat Quay installation, please see [Batteries-Included Quay Install on Red Hat OpenShift](https://www.youtube.com/watch?v=1_6jLGF5ByE)

For this walkthrough, we assume that our users have access to a pre-provisioned instance of Quay and have an existing or can create a new Quay user account.

### Red Hat Quay: A private container registry for distributed, secure development

Red Hat Quay is a private container registry that stores, builds, and deploys container images. It analyzes your images for security vulnerabilities, identifying potential issues that can help you mitigate security risks. Additionally, it delivers georeplication and BitTorrent distribution to increase performance across distributed development sites and increase resiliency and redundancy for disaster recovery.

![Quay Key Features](docs/graph/quay-key-features.png)

Our walkthrough will cover some of the features developers use when working with containers. We'll learn how to:

1. [Build your first container image and store it in the registry](walkthrough/01-build-your-first-container-image.md)
2. [Scan your container image for vulnerabilities](walkthrough/02-scan-your-container-image-for-vulnerabilities.md)
3. [Mirror container images from external sources](walkthrough/03-mirror-container-images-from-external-sources.md)
4. [Distribute your application using Helm](walkthrough/04-distribute-your-application-using-Helm.md)

Walkthrough is hosted on [GitHub Pages](https://adnan-drina.github.io/quay-demo/)
