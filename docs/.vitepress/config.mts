import { defineConfig } from "vitepress";

// https://vitepress.dev/reference/site-config
export default defineConfig({
  title: "Lumiere",
  description: "Documentation for Lumiere",
  base: "/lumiere/",
  head: [["link", { rel: "icon", href: "/lumiere/logo.svg" }]],
  cleanUrls: true,
  themeConfig: {
    // https://vitepress.dev/reference/default-theme-config
    logo: "/logo.svg",

    nav: [
      { text: "Home", link: "/" },
      { text: "Guides", link: "/guides" },
      { text: "API Reference", link: "/api" },
    ],

    sidebar: {
      "/api/": [
        { text: "Table of Contents", link: "/api" },
        {
          text: "General",
          items: [
            { text: "useLifecycleEvent", link: "/api/useLifecycleEvent" },
            { text: "LifecycleEvent", link: "/api/LifecycleEvent" },
            { text: "createSource", link: "/api/createSource" },
            { text: "Source", link: "/api/Source" },
            { text: "createMutator", link: "/api/createMutator" },
            { text: "Mutator", link: "/api/Mutator" },
            { text: "Bullet", link: "/api/Bullet" },
          ],
        },
        {
          text: "Parallel",
          items: [
            { text: "useBullet", link: "/api/useBullet" },
            { text: "deleteBullet", link: "/api/deleteBullet" },
            { text: "useDeletingSignal", link: "/api/useDeletingSignal" },
          ],
        },
      ],

      "/guides/": [
        {
          text: "Getting Started",
          items: [{ text: "Installation", link: "/guides" }],
        },
        {
          text: "Usage",
          items: [
            { text: "Scheduler", link: "/guides/scheduler" },
            { text: "Bullets", link: "/guides/bullets" },
          ],
        },
      ],
    },

    socialLinks: [
      { icon: "github", link: "https://github.com/synpixel/lumiere" },
    ],
  },
});
