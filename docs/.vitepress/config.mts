import { defineConfig } from "vitepress";

// https://vitepress.dev/reference/site-config
export default defineConfig({
  title: "Lumiere",
  description: "Documentation for Lumiere",
  base: "/lumiere/",
  head: [["link", { rel: "icon", href: "/logo.svg" }]],
  themeConfig: {
    // https://vitepress.dev/reference/default-theme-config
    logo: "/logo.svg",

    nav: [
      { text: "Home", link: "/" },
      { text: "Guides", link: "/guides" },
      { text: "API Reference", link: "/api/useLifecycleEvent" },
    ],

    sidebar: {
      "/api/": [
        {
          text: "Reference",
          items: [
            { text: "useLifecycleEvent", link: "/api/useLifecycleEvent" },
            { text: "LifecycleEvent", link: "/api/LifecycleEvent" },
            { text: "createSource", link: "/api/createSource" },
            { text: "Source", link: "/api/Source" },
            { text: "createMutator", link: "/api/createMutator" },
            { text: "Mutator", link: "/api/Mutator" },
          ],
        },
        {
          text: "Parallel",
          items: [
            { text: "useBullet", link: "/api/useBullet" },
            { text: "removeBullet", link: "/api/removeBullet" },
            { text: "useRemovingSignal", link: "/api/useRemovingSignal" },
          ],
        },
      ],
    },

    socialLinks: [
      { icon: "github", link: "https://github.com/synpixel/lumiere" },
    ],
  },
});
